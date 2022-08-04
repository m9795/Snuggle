class Public::CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      # flash.now[:notice] = 'コメントを投稿しました。'
      render 'post_comments'
    else
      render 'error'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    Comment.find(params[:id]).destroy
    # flash.now[:alert] = 'コメントを削除しました。'
    render 'post_comments'
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
