# frozen_string_literal: true

class Public::LikesController < ApplicationController
  before_action :authenticate_user!

  # いいね一覧ページ
  # 退会ユーザーの非公開投稿を省いて取得
  def like_list
    users = User.where(status: false)
    posts = Post.where(user_id: users, publish: true)
    user = User.find(params[:user_id])
    @liked_post = user.likes.where(post_id: posts)
    liked_post = user.likes.where(post_id: posts).order(post_created_at: "DESC")
    @page_liked_post = liked_post.page(params[:page]).per(5)
    @posts = user.posts.publish
    @user = User.find(params[:user_id])
  end

  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.new(post_id: @post.id)
    like.save
    render "replace"
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy
    render "replace"
  end
end
