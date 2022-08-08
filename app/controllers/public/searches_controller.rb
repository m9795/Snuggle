class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  # 退会ユーザー投稿と非公開記事を省いて取得
  def search
    @keyword = params[:keyword]
    @post = @publish_post_all.search(@keyword)
    users = User.where(status: false)
    @posts = current_user.posts.where(user_id: users, publish: true)
    @liked_post = current_user.likes.where(post_id: @publish_post_all)
  end
end