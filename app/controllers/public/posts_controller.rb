# frozen_string_literal: true

class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_choice, only: [:show, :edit, :map_edit, :update, :destroy]
  before_action :info_count, only: [:index, :tag, :shop_tag, :private_post]
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
    # ↓post.userのサイドバーの件数表示用
    @posts = @user.posts.publish
    @liked_post = @user.likes.where(post_id: @publish_post_all)

    # ↓公開記事は全員閲覧可
    if @post.publish
    # ↓非公開記は投稿ユーザのみ閲覧可
    elsif @post.publish == false && @post.user == current_user
    else
      redirect_to posts_path, alert: "お探しの投稿は見つかりません。"
    end
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
    if current_user == @post.user
      if @post.update(post_params)
        redirect_to post_path(@post), notice: "更新しました。"
      else
        redirect_to edit_post_path(@post), alert: "編集内容をご確認ください。"
      end
    else
      redirect_to posts_path, alert: "本人以外更新できません。"
    end
  end

  def destroy
    if current_user == @post.user
      @post.destroy
      redirect_to user_path(current_user), notice: "投稿を削除しました。"
    else
      redirect_to posts_path, alert: "本人以外は投稿を削除できません。"
    end
  end

  # タグ検索結果ページ
  def tag
    @tag = Tag.find_by(name: params[:name]) # タグ名の検索タイトル用
    @post = @tag.posts.publish # 検索結果の件数表示用
    @page_posts = @post.order(created_at: "DESC").page(params[:page]).per(5)
  end

  # 店舗設備タグ検索結果ページ
  def shop_tag
    @shop_tag = ShopTag.find_by(name: params[:name]) # 店舗設備タグ名の検索タイトル用
    @post = @shop_tag.posts.publish # 検索結果の件数表示用
    @page_posts = @post.order(created_at: "DESC").page(params[:page]).per(5)
  end

  # 非公開投稿ページ
  def private_post
    if current_user == User.find(params[:user_id])
      @page_unpublish_posts = current_user.posts.unpublish.order(created_at: "DESC").page(params[:page]).per(5)
    else
      redirect_to posts_path, alert: "非公開投稿は本人以外閲覧できません。"
    end
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

    # current_userサイドバーの件数表示用
    def info_count
      @posts = current_user.posts.publish
      @liked_post = current_user.likes.where(post_id: @publish_post_all)
    end
end
