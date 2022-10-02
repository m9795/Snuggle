# frozen_string_literal: true

class Public::HomesController < ApplicationController
  def top
    if user_signed_in?
      redirect_to user_path(current_user)
    elsif admin_signed_in?
      redirect_to admin_users_path
    end

    @newses = News.all.order(created_at: :DESC).limit(3)
  end

  def about
  end

  def news
    @newses = News.other_pagenation(params[:page])
  end
end
