# frozen_string_literal: true

class Admin::LikesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @likes = @user.likes
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_to admin_user_likes_path, notice: "いいねを削除しました。"
  end
end
