# frozen_string_literal: true

class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  # 退会ユーザー投稿と非公開記事を省いて取得
  def search
    @keyword = params[:keyword]
    @post = @publish_post_all.search(@keyword)
    posts = @publish_post_all.recent
    @page_posts = posts.search(@keyword).post_pagenation(params[:page])
    users = User.where(status: false)
    @posts = current_user.posts.where(user_id: users, publish: true)
    @liked_post = current_user.likes.where(post_id: @publish_post_all)
  end

  # ユーザ検索機能
  def user_search
    @method = params[:method]
    @content = params[:content]
    if @method == "name"
      @users = @publish_user_all.search_for(@content, @method)
      @records = @users.user_pagenation(params[:page])
    else
      @users = @publish_user_all.search_for(@content, @method)
      @records = @users.user_pagenation(params[:page])
    end
  end
end
