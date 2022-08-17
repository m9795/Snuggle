class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    users = User.all.order(created_at: 'DESC')
    @users = users.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_users_path, notice: 'ユーザー情報を更新しました。'
  end
  def user_params
    params.require(:user).permit(:name, :status)
  end
end
