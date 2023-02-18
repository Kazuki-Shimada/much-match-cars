require "test_helper"

class Public::CarsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_cars_show_url
    assert_response :success
  end

  test "should get new" do
    get public_cars_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_cars_edit_url
    assert_response :success
  end
end
