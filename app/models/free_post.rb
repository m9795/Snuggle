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
  belongs_to :user

  validates :content, presence: true
end
