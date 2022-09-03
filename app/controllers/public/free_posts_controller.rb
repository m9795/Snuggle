class Public::FreePostsController < ApplicationController

  def new
    @free_post = FreePost.new
  end

  def create
    @free_post = FreePost.new(free_post_params)
    @free_post.user_id = current_user.id
    if @free_post.save
      redirect_to free_posts_path, notice: "投稿しました。"
    else
      redirect_to request.referer, alert: "入力内容をご確認ください。"
    end
  end

  def index
    @free_posts = FreePost.all
  end

  def destroy
  end

  private
    def free_post_params
      params.require(:free_post).permit(:content)
    end
end
