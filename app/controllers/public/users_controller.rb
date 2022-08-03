class Public::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(usre_params)
      redirect_to user_path(user), notice: "ユーザ情報を更新しました。"
    else
      render 'edit'
    end
  end

  def unsubscribe
  end

  def search
  end

  private
  def usre_params
    params.require(:user).permit(:name, :introduction, :status)
  end
end
