# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # 投稿の並び順
  scope :recent, -> { order(created_at: :DESC) }

  # ページネーション
  scope :post_pagenation, -> (page) { recent.page(page).per(5) }
  scope :user_pagenation, -> (page) { recent.page(page).per(10) }
  scope :other_pagenation, -> (page) { recent.page(page).per(20) }
end