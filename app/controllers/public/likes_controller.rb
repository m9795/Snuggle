# frozen_string_literal: true

class Public::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :post_choice, only: [:create, :destroy]

  # お気に入り一覧ページ
  def like_list
    @user = User.find(params[:user_id])
    @liked_post = @user.likes.where(post_id: @publish_post_all) # お気に入り件数用
    @page_liked_post = @liked_post.where(post_id: @publish_post_all).order(created_at: "DESC").page(params[:page]).per(5) # お気に入りした順に表示
    @posts = @user.posts.publish
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
