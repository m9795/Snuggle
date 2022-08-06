# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :likes,    dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy

  validates :title,   presence: true, length: { minimum: 1 , maximum: 140 }
  validates :content, presence: true, length: { minimum: 1 , maximum: 3000 }

  has_one_attached :image

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def self.search_for(content, method)
    if method == 'partial'
      Post.where('title LIKE?', '%' + content + '%')
    elsif method == 'perfect'
      Post.where(title: content)
    elsif method == 'forward'
      Post.where('title LIKE?', content + '%')
    else
      Post.where('title LIKE?', '%' + content)
    end
  end
end
