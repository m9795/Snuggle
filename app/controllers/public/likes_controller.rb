class Public::LikesController < ApplicationController
  before_action :authenticate_user!
  
  # 退会ユーザーの非公開投稿を省いて表示
  def like_list
    users = User.where(status: false)
    posts = Post.where(user_id: users, publish: true)
    @liked_post = current_user.likes.where(post_id: posts)
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
