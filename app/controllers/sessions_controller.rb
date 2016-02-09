class SessionsController < Devise::SessionsController
  def respond_with(resource, opts = {})
    render js: @session
  end
end
