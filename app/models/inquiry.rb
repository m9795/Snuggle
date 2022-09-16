class Inquiry
  include ActiveModel::Model
  attr_accessor :name, :email, :message, :user_name, :user_email

  validates :name, length: { maximum: 20 }
  validates :email, presence: true
  validates :message, length: { maximum: 1000 }

end
