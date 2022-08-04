class Public::CommentsController < ApplicationController

  def new
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end

  def destroy
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:text)
  end
end
