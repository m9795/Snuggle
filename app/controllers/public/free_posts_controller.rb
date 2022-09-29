class Public::FreePostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @free_post = FreePost.new
    @free_posts = FreePost
    .where(user_id: @publish_user_all)
    .other_pagenation(params[:page])
  end

  def create
    @free_post = FreePost.new(free_post_params)
    @free_post.user_id = current_user.id
    if @free_post.save
      redirect_to free_posts_path, notice: "投稿しました。"
    else
      render "new"
    end
  end

  def index
    @free_posts = FreePost
    .where(user_id: @publish_user_all)
    .other_pagenation(params[:page])
  end

  def show
    user_free_post = FreePost.find(params[:id])
    if user_free_post.user.status == false
      @free_post = FreePost.find(params[:id])
    else
      redirect_to free_posts_path, alert: "お探しのページは見つかりませんでした。"
    end
    # @free_post = FreePost.find(params[:id])
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
      params.require(:free_post).permit(:content, images: [])
    end
end
