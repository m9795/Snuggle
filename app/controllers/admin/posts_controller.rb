class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    # @user = User.find(params[:user_id])
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def destroy
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer, notice: '投稿を削除しました。'
  end
end
