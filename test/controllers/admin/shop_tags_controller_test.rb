require "test_helper"

class Admin::ShopTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_shop_tags_new_url
    assert_response :success
  end
end
