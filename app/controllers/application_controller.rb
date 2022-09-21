# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :publish_quantity

  # 退会ユーザー、非公開記事を省く処理
  def publish_quantity
    @publish_user_all = User.where(status: false) # 有効ユーザ
    @publish_post_all = Post.where(user_id: @publish_user_all, publish: true) # 有効ユーザの公開記事
  end

end
