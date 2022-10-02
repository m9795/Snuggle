# == Schema Information
#
# Table name: news
#
#  id         :integer          not null, primary key
#  content    :string
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class NewsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
