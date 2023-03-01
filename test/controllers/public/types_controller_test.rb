require "test_helper"

class Public::TypesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_types_show_url
    assert_response :success
  end
end
