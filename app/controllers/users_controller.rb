class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to '/'
  end

  def show
    @user = User.find(params[:user_id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
