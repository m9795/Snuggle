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

  validates :name, presence: true, length: { minimum: 1, maximum: 50 }

  has_one_attached :image
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def self.guest
    find_or_create_by!(name: 'guest user', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'guest user'
    end
  end
  
  def self.search_for(content, method)
    if method == 'partial'
      User.where('name LIKE?', '%' + content + '%')
    elsif method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE?', content + '%')
    else
      User.where('name LIKE?', '%' + content)
    end
  end
end
