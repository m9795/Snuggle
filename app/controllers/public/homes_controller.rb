# frozen_string_literal: true

class Public::HomesController < ApplicationController
  def top
    if user_signed_in?
      redirect_to user_path(current_user)
    elsif admin_signed_in?
      redirect_to admin_users_path
    end
  end

  def about
  end
end
