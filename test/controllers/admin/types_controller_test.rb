require "test_helper"

class Admin::TypesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_types_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_types_edit_url
    assert_response :success
  end

  test "should get index" do
    get admin_types_index_url
    assert_response :success
  end
end
