class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:new, :create, :update, :cancel]
  prepend_before_action :authenticate_scope!, only: [:edit, :destroy]
  respond_to :json
  respond_to :js
  after_filter :transfer_guest_to_user, only: :create,
               if: -> { @user.valid? }


  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  def update
    if current_or_guest_user.guest?
      self.resource = resource_class.to_adapter.get!(send(:"guest_user").to_key)
    else
      self.resource = resource_colass.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    end
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
                      :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def transfer_guest_to_user
    if guest_user
      puts guest_user.name
      puts @user.name
      @user.annex_and_destroy!(@guest_user)
    end
  end
end
