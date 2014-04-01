class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:user][:username])
    if @user && @user.is_password(params[:user][:password])
      session[:token] = @user.reset_token!
      redirect_to goals_url
    else
      flash.now[:errors] = ["Wrong username or password"]
      render :new
    end
  end


  def destroy
    current_user.reset_token!
    session[:token] = nil
    redirect_to new_session_url
  end
end
