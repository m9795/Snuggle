class Inquiry
  include ActiveModel::Model
  attr_accessor :name, :email, :message, :user_id, :user_name, :user_email

  validates :name, length: { maximum: 20 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :message, length: { maximum: 1000 }
end
