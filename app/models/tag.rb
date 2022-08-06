# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy

  def self.search(search)
    if search != '#'
      tag = Tag.where(name: search)
      tag[0].post
    else
      Post.all
    end
  end
end
