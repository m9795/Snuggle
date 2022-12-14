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
