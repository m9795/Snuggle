# frozen_string_literal: true

class Public::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :post_choice, only: [:create, :destroy]

  # お気に入り一覧ページ
  def like_list
    @user = User.find(params[:user_id])
    if @user.status == false
      # ↓お気に入り件数表示用
      @liked_post = @user.likes
      .where(post_id: @publish_post_all)

      # ↓投稿をお気に入りした順に表示
      @page_liked_post = Post.joins(:likes)
      .where(likes: { user_id: @user })
      .where(id: @publish_post_all)
      .merge(Like.recent)
      .post_pagenation(params[:page])
      @posts = @user.posts.publish
    else
      redirect_to user_path(current_user), alert: "お探しのページは見つかりませんでした。"
    end
  end

  def create
    like = current_user.likes.new(post_id: @post.id)
    like.save
    render "replace"
  end

  def destroy
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy
    render "replace"
  end

  private
    def post_choice
      @post = Post.find(params[:post_id])
    end
end
