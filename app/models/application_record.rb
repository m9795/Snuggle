# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # 投稿の並び順
  scope :recent, -> { order(created_at: :DESC) }
end
