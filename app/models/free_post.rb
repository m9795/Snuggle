# == Schema Information
#
# Table name: free_posts
#
#  id         :integer          not null, primary key
#  content    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_free_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class FreePost < ApplicationRecord
  FILE_NUMBER_LIMIT = 6
  belongs_to :user

  validates :content, presence: true
  validate :validate_number_of_files

  has_many_attached :images

  private
    def validate_number_of_files
      return if images.length <= FILE_NUMBER_LIMIT
      errors[:images] << "添付は#{FILE_NUMBER_LIMIT}枚までです"
    end
end
