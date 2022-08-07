class Public::LikesController < ApplicationController
  before_action :authenticate_user!
  def like_list
    likes = Like.where(user_id: current_user.id).pluck(:post_id)
    @liked_post = Post.find(likes)
  end

  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.new(post_id: @post.id)
    like.save
    render 'replace'
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy
    render 'replace'
  end
end
