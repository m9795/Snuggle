# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  content        :text             not null
#  lat            :float
#  lng            :float
#  publish        :boolean          default(TRUE), not null
#  shop_detail    :string
#  shop_home_page :text
#  shop_name      :string
#  shop_place     :string
#  shop_remarks   :string
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer          not null
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
  has_many :tags, through: :taggings
  has_many :shop_taggings, dependent: :destroy
  has_many :shop_tags, through: :shop_taggings, dependent: :destroy

  validates :title, presence: true, length: { maximum: 140 }

  # contentやその他カラムはフォームでmaxlengthの指定のみしています。
  # (改行2文字扱いに対するカスタムバリデーションをかけようとしたが発火しなかったため。)
  validates :content, presence: true

  # 投稿画像設定
  has_one_attached :image
  def get_image
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.png")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    image
  end

  # いいね機能
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  # タグ機能（投稿保存前に実行する）
  after_create do
    post = Post.find_by(id: self.id)
    tags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    post.tags = []
    tags.uniq.map do |tag|
      tag = Tag.find_or_create_by(name: tag.downcase.delete("#"))
      post.tags << tag
    end
  end
  # タグ機能（投稿更新前に実行する）
  before_update do
    post = Post.find_by(id: self.id)
    post.tags.clear
    tags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |tag|
      tag = Tag.find_or_create_by(name: tag.downcase.delete("#"))
      post.tags << tag
    end
  end

  # 検索機能
  def self.search(search)
    if search != nil
      Post.where("title LIKE(?) or content LIKE(?)", "%#{search}%",  "%#{search}%")
    else
      Post.all
    end
  end

  # 投稿の公開・非公開の絞り込み
  scope :publish,   -> { where(publish: true) }
  scope :unpublish, -> { where(publish: false) }
end
