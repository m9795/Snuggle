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
    @free_posts = FreePost.where(user_id: @publish_user_all).order(created_at: "DESC").page(params[:page]).per(20)
  end

  def show
    @free_post = FreePost.find(params[:id])
  end

  def destroy
    @free_post = FreePost.find(params[:id])
    if current_user == @free_post.user
      @free_post.destroy
      redirect_to free_posts_path, notice: "投稿を削除しました。"
    else
      redirect_to free_posts_path, alert: "本人以外は投稿を削除できません。"
    end
  end

  private
    def free_post_params
      params.require(:free_post).permit(:content)
    end
end
