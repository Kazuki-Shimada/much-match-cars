require "test_helper"

class Admin::ManufacturersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_manufacturers_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_manufacturers_edit_url
    assert_response :success
  end
end
