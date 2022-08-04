class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      redirect_to posts_path, notice: '投稿しました。'
    else
      render 'new', '入力内容をご確認ください。'
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user
    if @user == current_user
      render 'edit'
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '投稿を更新しました。'
    else
      render 'edit', notice: '入力内容をご確認ください。'
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
    params.require(:post).permit(:user_id, :image, :title, :content)
  end
end
