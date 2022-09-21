# frozen_string_literal: true

class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_choice, only: [:new, :create, :destroy]
  def new
    @comment = Comment.new
    comments = @post.comments.where(user_id: @publish_user_all)
    @post_comments = comments.recent
  end

  def create
    @post_comments = @post.comments.where(user_id: @publish_user_all).recent
    comment = current_user.comments.new(comment_params)
    comment.post_id = @post.id
    comment.save
    render "post_comments"
  end

  def destroy
    @post_comments = @post.comments.where(user_id: @publish_user_all).recent
    Comment.find(params[:id]).destroy
    render "post_comments"
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end

    def post_choice
      @post = Post.find(params[:post_id])
      if @post.user.status == true
        redirect_to posts_path,  alert: "お探しのページは見つかりませんでした。"
      end
    end
end
