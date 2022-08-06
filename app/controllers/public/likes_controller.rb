class Public::LikesController < ApplicationController
  before_action :authenticate_user!
  def liked_post
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
