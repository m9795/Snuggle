# frozen_string_literal: true

class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments.recent
    @page_comments = @comments.other_pagenation(params[:page])
  end

  def destroy
    @comments = Post.find(params[:post_id]).comments.recent
    Comment.find(params[:id]).destroy
    render "admin/comments/comments"
  end
end
