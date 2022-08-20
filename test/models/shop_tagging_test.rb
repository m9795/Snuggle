# == Schema Information
#
# Table name: shop_taggings
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  post_id     :integer          not null
#  shop_tag_id :integer          not null
#
# Indexes
#
#  index_shop_taggings_on_post_id      (post_id)
#  index_shop_taggings_on_shop_tag_id  (shop_tag_id)
#
# Foreign Keys
#
#  post_id      (post_id => posts.id)
#  shop_tag_id  (shop_tag_id => shop_tags.id)
#
require "test_helper"

class ShopTaggingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
