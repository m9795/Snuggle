class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_choice, only: [:new, :create, :destroy]
  def new
    @comment = Comment.new
    comments = @post.comments.where(user_id: @publish_user_all)
    @post_comments = comments.order(created_at: 'DESC')
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
    # create失敗時もrender先は同じ
    comments = @post.comments.where(user_id: @publish_user_all)
    @post_comments = comments.order(created_at: 'DESC')
    # @post_comments = @post.comments.where(user_id: @publish_user_all)
    render 'post_comments'
  end

  def destroy
    Comment.find(params[:id]).destroy
    render 'post_comments'
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end

    def post_choice
      @post = Post.find(params[:post_id])
    end
end
