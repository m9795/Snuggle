# frozen_string_literal: true

class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_choice, only: [:show, :edit, :map_edit, :update, :destroy]
  before_action :info_count, only: [:index, :tag, :private_post]
  before_action :show_user, only: [:show, :edit]

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      redirect_to post_path(post), notice: "投稿しました。"
    else
      redirect_to new_post_path(post), alert: "入力内容をご確認ください。"
    end
  end

  # 退会ユーザーと非公開記事を省いて取得
  def index
    @page_posts = @publish_post_all.order(created_at: "DESC").page(params[:page]).per(5)
  end

  def show
    @posts = @user.posts.publish # post.userのinfoカウント用
    @liked_post = @user.likes.where(post_id: @publish_post_all) # post.userのinfoカウント用
  end

  def edit
    if @user == current_user
      render "edit"
    else
      redirect_to post_path(@post), alert: "本人のみ編集可能です。"
    end
  end

  def map_edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "更新しました。"
    else
      redirect_to edit_post_path(@post), alert: "編集内容をご確認ください。"
    end
  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user), notice: "投稿を削除しました。"
  end

  # タグ検索結果ページ
  def tag
    @tag = Tag.find_by(name: params[:name]) # タグ名を検索タイトル用
    @post = @tag.posts.publish # 検索結果の件数表示用
    @page_posts = @post.order(created_at: "DESC").page(params[:page]).per(5)
  end

  # 非公開投稿ページ
  def private_post
    @page_unpublish_posts = current_user.posts.unpublish.order(created_at: "DESC").page(params[:page]).per(5)
  end

  private
    def post_params
      params.require(:post).permit(:image, :title, :content, :shop_name, :shop_detail, :shop_place, :shop_home_page, :shop_remarks,  :lat, :lng, :publish, shop_tag_ids: [])
    end

    def show_user
      @user = @post.user
    end

    def post_choice
      if (params[:id]).present?
        @post = Post.find(params[:id])
      else
        @post = Post.find(params[:post_id])
      end
    end

    # current_userのinfo 件数用
    def info_count
      @posts = current_user.posts.publish
      @liked_post = current_user.likes.where(post_id: @publish_post_all)
    end
end
