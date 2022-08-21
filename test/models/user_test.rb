# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  favorite_cafe          :string
#  favorite_color         :string
#  favorite_drink         :string
#  favorite_food          :string
#  fighting               :string
#  introduction           :text
#  name                   :string           not null
#  relax                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sleeping_time          :string
#  status                 :boolean          default(FALSE), not null
#  study_content          :string
#  studying_time          :string
#  target                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
