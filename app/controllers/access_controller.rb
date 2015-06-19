class AccessController < ApplicationController
before_action :prevent_login_signup, only: [:signup, :login] #only on the sign up and login pages if
#you already have a user_id

  def signup
    @user= User.new
  end

  def create
    @user= User.create user_params
    if @user.save
      flash[:notice] = "New User Has Been Created!"
      session[:user_id] = @user.id
    redirect_to home_path
  else
    render :signup
    end
  end

def attempt_login
  if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
        redirect_to home_path
      else
        flash[:notice] = "Failed username/password"
        render :login
    end
   else
    flash[:notice] = "Failed username/password"
        render :login
    end
end

  def login
    # @user= User.find
  end

  def home
  end

  def logout
    session[:user_id]= nil

    redirect_to login_path
  end
private
    def user_params
      params.require(:user).permit(:username, :password, :password_digest)
    end
    def prevent_login_signup
      if session[:user_id]
        redirect_to home_path
    end
  end
end
