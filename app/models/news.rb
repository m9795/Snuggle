# == Schema Information
#
# Table name: news
#
#  id         :integer          not null, primary key
#  content    :string
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class News < ApplicationRecord
  validates :title, presence: true
end
