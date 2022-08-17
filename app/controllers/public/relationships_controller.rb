class Public::RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer, notice: "フォローしました。"
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer, notice: "フォロー解除しました。"
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings.where(id: @publish_user_all).page(params[:page])
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers.where(id: @publish_user_all).page(params[:page])
  end
end