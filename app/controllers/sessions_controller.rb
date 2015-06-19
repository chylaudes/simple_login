class SessionsController < ApplicationController
def create
  # user = User.from_omniauth(env["omniauth.auth"])
  render :text => request.env['rack.auth'].inspect
  session[:user_id] = user.id
  redirect_to home_path
end

end