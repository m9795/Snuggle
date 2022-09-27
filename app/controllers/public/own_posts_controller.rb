class Public::OwnPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_choice, only: [:new, :create, :index, :destroy]
  before_action :user_status_check, only: [:index]
  before_action :current_user_chesk, only: [:new, :create, :destroy]

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
    @own_posts = @user.own_posts.other_pagenation(params[:page])
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

    def user_status_check
      if @user.status == true
        redirect_to user_path(current_user), alert: "お探しのページは見つかりませんでした。"
      end
    end

    def current_user_chesk
      unless @user == current_user
        redirect_to user_path(current_user), alert: "本人以外、権限がありません。"
      end
    end
end
