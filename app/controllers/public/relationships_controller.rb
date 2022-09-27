# frozen_string_literal: true

class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
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
    if @user.status == false
      @users = @user.followings.where(id: @publish_user_all).user_pagenation(params[:page])
    else
      redirect_to user_path(current_user), alert: "お探しのページは見つかりませんでした。"
    end
  end

  def followers
    @user = User.find(params[:user_id])
    if @user.status == false
      @users = @user.followers.where(id: @publish_user_all).user_pagenation(params[:page])
    else
      redirect_to user_path(current_user), alert: "お探しのページは見つかりませんでした。"
    end
  end
end
