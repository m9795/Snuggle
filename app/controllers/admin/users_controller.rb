class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_users_path
  end

  def destroy
    user = User.find(params[:id])
    Comment.find(params[:id]).destroy
    redirect_to admin_user_path(user)
  end

  def user_params
    params.require(:user).permit(:name, :status)
  end
end
