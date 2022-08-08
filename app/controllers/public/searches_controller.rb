class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  # 退会ユーザー投稿と非公開記事を省いて取得
  def search
    @keyword = params[:keyword]
    @post = @publish_post_all.search(@keyword)
  end
end