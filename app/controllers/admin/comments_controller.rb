class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments.order(created_at: 'DESC')
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to request.referer, notice: 'コメントを削除しました。'
  end
end
