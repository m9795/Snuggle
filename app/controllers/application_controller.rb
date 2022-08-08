class ApplicationController < ActionController::Base
  before_action :publish_quantity

  # ヘッダーの件数（退会ユーザー、非公開記事を省く処理）
  def publish_quantity
    @publish_user_all = User.where(status: false)
    @publish_post_all = Post.where(user_id: @publish_user_all, publish: true)
  end
end