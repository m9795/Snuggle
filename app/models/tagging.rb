# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#  tag_id     :integer          not null
#
# Indexes
#
#  index_taggings_on_post_id  (post_id)
#  index_taggings_on_tag_id   (tag_id)
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#  tag_id   (tag_id => tags.id)
#
class Tagging < ApplicationRecord
  belongs_to :post
  belongs_to :tag
  with_options presence: true do
    validates :post_id
    validates :tag_id
  end
end