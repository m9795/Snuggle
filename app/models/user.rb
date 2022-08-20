# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  introduction           :text
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  status                 :boolean          default(FALSE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts,    dependent: :destroy
  has_many :likes,    dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :own_posts
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :introduction, correct_line_break: true

  # アイコン画像設定
  has_one_attached :image
  def get_image
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_icon.png")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    image
  end

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(name: "guest user", email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guest user"
    end
  end

  # 有効・退会の絞り込み
  scope :publish, -> { where(statue: false) }
  scope :unpublish, -> { where(status: true) }

  # フォロー機能
  # "フォローする"
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # "フォロー解除"
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # "フォローしているか判定"
  def following?(user)
    followings.include?(user)
  end

  # ユーザ検索機能（部分一致）
  def self.search_for(content, method)
    if method == "name"
      # 名前から検索
      User.where("name LIKE?", "%" + content + "%")
    else
      # 紹介文から検索
      User.where("introduction LIKE?", "%" + content + "%")
    end
  end
end
