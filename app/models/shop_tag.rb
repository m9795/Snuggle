# == Schema Information
#
# Table name: shop_tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShopTag < ApplicationRecord
  has_many :shop_taggings, dependent: :destroy
  has_many :posts, through: :shop_taggings, dependent: :destroy
end
