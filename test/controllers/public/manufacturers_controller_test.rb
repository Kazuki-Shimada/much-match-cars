require "test_helper"

class Public::ManufacturersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_manufacturers_show_url
    assert_response :success
  end
end
