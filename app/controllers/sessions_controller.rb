class SessionsController < ApplicationController

  def new
    if logged_in
      redirect_to '/welcome'
    end
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      flash[:notice] = "Invalid login, please try again!"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
