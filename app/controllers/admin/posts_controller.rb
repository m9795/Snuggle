# frozen_string_literal: true

class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :user_choice, only: [:index, :show]
  before_action :post_choice, only: [:show, :destroy]

  def index
    @posts = @user.posts.order(created_at: "DESC")
  end

  def show
    @comments = @post.comments.order(created_at: "DESC")
    @page_comments = @comments.page(params[:page])
  end

  def destroy
    @post.destroy
    redirect_to request.referer, notice: "投稿を削除しました。"
  end

  private
    def user_choice
      @user = User.find(params[:user_id])
    end

    def post_choice
      @post = Post.find(params[:id])
    end
end
