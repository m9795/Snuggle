class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

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
    if @user == current_user
      render 'edit'
    else
      redirect_to user_path(@user), alert: '本人のみ編集可能です。'
    end
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

    def ensure_guest_user
      @user = User.find(params[:id])
      if @user.name == 'guest user'
        redirect_to user_path(current_user), alert: 'プロフィール編集には新規登録が必要です。'
      end
    end
end
