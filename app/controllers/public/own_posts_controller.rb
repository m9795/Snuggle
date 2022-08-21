class Public::OwnPostsController < ApplicationController
  before_action :user_choice, only: [:new, :create, :index, :destroy]

  def new
    @own_post = OwnPost.new
  end

  def create
    own_post = OwnPost.new(own_post_params)
    own_post.user_id = current_user.id
    if own_post.save
      redirect_to user_own_posts_path(@user), notice: "つぶやきました。"
    else
      redirect_to request.referer, alert: "つぶやけませんでした。"
    end
  end

  def index
    @own_posts = @user.own_posts.order(created_at: "DESC").page(params[:page]).per(20)
  end

  def destroy
    own_post = OwnPost.find(params[:id])
    if own_post.user_id == current_user.id
      own_post.destroy
      redirect_to request.referer, notice: "つぶやきを削除しました。"
    else
      redirect_to request.referer, alert: "本人以外削除できません。"
    end
  end

  private
    def own_post_params
      params.require(:own_post).permit(:content)
    end

    def own_post_choice
      @own_post = OwnPost.find(params[:id])
    end

    def user_choice
      @user = User.find(params[:user_id])
    end
end
