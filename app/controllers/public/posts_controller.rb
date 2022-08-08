class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      redirect_to post_path(post), notice: '投稿しました。'
    else
      redirect_to new_post_path(post), alert: '入力内容をご確認ください。'
    end
  end

# 退会ユーザーと非公開記事を省いて取得
  def index
    users = User.where(status: false)
    @posts = Post.where(user_id: users, publish: true)
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
      redirect_to post_path(@post), alert: '本人のみ編集可能です。'
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post_path(post), notice: '投稿内容を更新しました。'
    else
      redirect_to edit_post_path(post), alert: '編集内容をご確認ください。'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: '投稿を削除しました。'
  end

# タグ検索結果ページ
# 退会ユーザー投稿と非公開投稿を省いて取得
  def tag
    @tag = Tag.find_by(name: params[:name])
    @post = @publish_post_all.search(@tag.name)
  end

  # 非公開投稿ページ
  def private_post
    @user = current_user
    @posts = @user.posts.unpublish
  end

private
  def post_params
    params.require(:post).permit(:image, :title, :content, :publish)
  end
end