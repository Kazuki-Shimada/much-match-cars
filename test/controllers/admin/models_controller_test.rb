require "test_helper"

class Admin::ModelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_models_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_models_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_models_edit_url
    assert_response :success
  end
end
