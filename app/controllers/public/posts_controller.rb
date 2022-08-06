class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.new
    # ヘッダーに全体数を表示
    # @post_all = Post.all
    # @user_all = User.all
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      redirect_to post_path(post), notice: '投稿しました。'
    else
      render 'new', alert: '入力内容をご確認ください。'
    end
  end

  def index
    @posts = Post.all
    # ヘッダーに全体数を表示
    # @post_all = Post.all
    # @user_all = User.all
  end

  def show
    @post = Post.find(params[:id])
    # ヘッダーに全体数を表示
    # @post_all = Post.all
    # @user_all = User.all
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user
    if @user == current_user
      render 'edit'
    else
      redirect_to post_path(@post), alert: '本人のみ編集可能です。'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '投稿を更新しました。'
    else
      render 'edit', alert: '入力内容をご確認ください。'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: '投稿を削除しました。'
  end

  def search
  end

private
  def post_params
    params.require(:post).permit(:image, :title, :content)
  end
end
