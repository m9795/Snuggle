class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  before_action :user_choice, only: [:post_choice, :posts, :show, :update]
  before_action :info_count, only: [:posts, :show]

  def index
    @users = @publish_user_all.page(params[:page]).per(10)
  end

  def edit
    if @user == current_user
      render 'edit'
    else
      redirect_to user_path(@user), alert: '本人のみ編集可能です。'
    end
  end

  def update
    if @user.update(usre_params)
      redirect_to user_path(@user), notice: "ユーザ情報を更新しました。"
    else
      redirect_to edit_user_path(@user), alert: '編集内容をご確認ください。'
    end
  end

  # レスポンシブ時の表示を変えるためshowとpostsで分けています
  # レスポンシブ時ユーザー情報のみ表示
  def show
  end

  # レスポンシブ時ユーザーの投稿一覧のみ表示
  def posts
  end

  # 退会確認ページ
  def unsubscribe
  end

  # 退会処理（論理削除）
  def withdraw
    @user = current_user
    @user.update(status: true)
    sign_out current_user
    redirect_to root_path, notice: 'ご利用いただきありがとうございました！またのご利用をお待ちしております。'
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

    def user_choice
      if (params[:id]).present?
        @user = User.find(params[:id])
      else
        @user = User.find(params[:user_id])
      end
    end

    def info_count
      @posts = @user.posts.publish
      @liked_post = @user.likes.where(post_id: @publish_post_all)
    end
end
