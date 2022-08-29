# frozen_string_literal: true

class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments.order(created_at: "DESC")
    @page_comments = @comments.page(params[:page]).per(20)
  end

  def destroy
    @comments = Post.find(params[:post_id]).comments.order(created_at: "DESC")
    Comment.find(params[:id]).destroy
    render "admin/comments/comments"
  end
end
