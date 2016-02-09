class SessionsController < Devise::SessionsController
  respond_to :json
  respond_to :js
end
