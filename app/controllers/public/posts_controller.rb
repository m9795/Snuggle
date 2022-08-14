class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_choice, only: [:show, :edit, :update, :destroy]
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
    @posts = @publish_post_all.page(params[:page]).per(5)
    @current_user_posts = current_user.posts.where(id: @publish_post_all)
    @liked_post = current_user.likes.where(post_id: @publish_post_all)
  end

  def show
    @user = @post.user
    @posts = @user.posts.publish
    @liked_post = @user.likes.where(post_id: @publish_post_all)
  end

  def edit
    @user = @post.user
    if @user == current_user
      render 'edit'
    else
      redirect_to post_path(@post), alert: '本人のみ編集可能です。'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '投稿内容を更新しました。'
    else
      redirect_to edit_post_path(@post), alert: '編集内容をご確認ください。'
    end
  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user), notice: '投稿を削除しました。'
  end

# タグ検索結果ページ
# 退会ユーザー投稿と非公開投稿を省いて取得
  def tag
    @tag = Tag.find_by(name: params[:name])
    @post = @publish_post_all.search(@tag.name)
    users = User.where(status: false)
    @posts = current_user.posts.where(user_id: users, publish: true)
    @liked_post = current_user.likes.where(post_id: @publish_post_all)
  end

  # 非公開投稿ページ
  def private_post
    @user = current_user
    @unpublish_posts = @user.posts.unpublish
    users = User.where(status: false)
    @posts = current_user.posts.where(user_id: users, publish: true)
    @liked_post = current_user.likes.where(post_id: @publish_post_all)
  end

private
  def post_params
    params.require(:post).permit(:image, :title, :content, :publish)
  end

  def post_choice
    if (params[:id]).present?
      @post = Post.find(params[:id])
    else
      @post = Post.find(params[:post_id])
    end
  end
end