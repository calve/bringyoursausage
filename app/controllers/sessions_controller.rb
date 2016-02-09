class SessionsController < Devise::SessionsController

  # # POST /resource/sign_in
  # def create
  #   self.resource = warden.authenticate!(auth_options)
  #   set_flash_message(:notice, :signed_in) if is_flashing_format?
  #   sign_in(resource_name, resource)
  #   yield resource if block_given?
  #   respond_with resource, location: after_sign_in_path_for(resource)
  # end
  
  def respond_with(resource, opts = {})
    respond_to do |format|
      format.js { render :show, status: :ok, location: @session }
      format.html { render :resource, location: opts[:location] }
    end
  end
end
