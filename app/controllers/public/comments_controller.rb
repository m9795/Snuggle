class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
    # create失敗時もrender先は同じ
    render 'post_comments'
  end

  def destroy
    @post = Post.find(params[:post_id])
    Comment.find(params[:id]).destroy
    render 'post_comments'
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
