# frozen_string_literal: true

class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  before_action :user_choice, only: [:posts, :show, :update, :detail]
  before_action :info_count, only: [:posts, :show]
  before_action :user_status_check, only: [:posts, :show, :detail]

  def index
    @users = @publish_user_all.user_pagenation(params[:page])
  end

  def edit
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(@user),
      alert: "本人のみ編集可能です。"
    end
  end

  def update
    if @user.update(usre_params)
      redirect_to user_detail_path(@user),
      notice: "ユーザ情報を更新しました。"
    else
      redirect_to edit_user_path(@user),
      alert: "編集内容をご確認ください。"
    end
  end

  # レスポンシブ時の表示を変えるためshowとpostsで分けています
  def show # レスポンシブ時ユーザー情報のみ表示
  end

  def posts # レスポンシブ時ユーザーの投稿一覧のみ表示
  end

  # 退会確認ページ
  def unsubscribe
  end

  # 退会処理（論理削除）
  def withdraw
    current_user.update(status: true)
    sign_out current_user
    redirect_to root_path,
    notice: "ご利用いただきありがとうございました！",
    alert: "またのご利用をお待ちしております。"
  end

  def detail
  end

  def followings_posts
    # current_userサイドバーの件数表示用
    @posts = current_user.posts.publish
    @liked_post = current_user.likes.where(post_id: @publish_post_all)

    # フォローユーザーと自身の投稿件数の取得
    followings = current_user.followings.where(id: @publish_user_all)
    @following_posts = @publish_post_all.where(user_id: followings)
    .or(@publish_post_all.where(user_id: current_user))

    # フォローユーザーと自身の投稿の表示用
    @page_posts = @following_posts.post_pagenation(params[:page])
  end

  def chat_rooms
    # 現在チャットルームのあるユーザー
    user_rooms = current_user.rooms
    @chat_room_users = User.joins(:rooms)
    .where(rooms: { id: user_rooms })
    .where(id: @publish_user_all)
    .where.not(id: current_user).user_pagenation(params[:page])
  end

  private
    def usre_params
      params.require(:user).permit(:image, :name, :introduction, :status,
      :study_content, :target, :sleeping_time, :studying_time, :relax, :fighting,
      :favorite_color, :favorite_cafe, :favorite_drink, :favorite_food)
    end

    def ensure_guest_user
      @user = User.find(params[:id])
      if @user.name == "guest user"
        redirect_to user_path(current_user), alert: "ゲストユーザはプロフィール編集できません。"
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
      @posts = @user.posts.recent.publish
      @page_posts = @posts.post_pagenation(params[:page])
      @liked_post = @user.likes.where(post_id: @publish_post_all)
    end

    def user_status_check
      if @user.status == true
        redirect_to users_path, alert: "お探しのページは見つかりませんでした。"
      end
    end
end
