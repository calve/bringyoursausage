class SessionsController < Devise::SessionsController
  respond_to :json
  respond_to :js
  after_filter :transfer_guest_to_user, only: :create,
               if: -> { @user.valid? }

  def transfer_guest_to_user
    if guest_user
      puts guest_user.name
      puts @user.name
      @user.annex_and_destroy!(@guest_user)
    end
  end
end
