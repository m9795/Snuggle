# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  message    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_chats_on_room_id  (room_id)
#  index_chats_on_user_id  (user_id)
#
# Foreign Keys
#
#  room_id  (room_id => rooms.id)
#  user_id  (user_id => users.id)
#
class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :message, presence: true, length: { maximum: 200 }
end
