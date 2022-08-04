class Public::UsersController < ApplicationController
  def index
    @users = User.all
    # ヘッダーに全体数を表示
    # @post_all = Post.all
    # @user_all = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post_all = Post.all
    # ヘッダーに全体数を表示
    # @post_all = Post.all
    # @user_all = User.all
  end

  def edit
    @user = User.find(params[:id])
    # ヘッダーに全体数を表示
    # @post_all = Post.all
    # @user_all = User.all
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

  def withdraw
    @user = current_user
    @user.update(status: true)
    sign_out current_user
    redirect_to root_path, notice: 'ご利用いただきありがとうございました。またのご利用をお待ちしております。'
  end

  def search
  end

  private
  def usre_params
    params.require(:user).permit(:image, :name, :introduction, :status)
  end
end
