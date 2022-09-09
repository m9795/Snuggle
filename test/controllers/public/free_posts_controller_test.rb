require "test_helper"

class Public::FreePostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_free_posts_index_url
    assert_response :success
  end
end
