require "test_helper"

class Public::ModelsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_models_show_url
    assert_response :success
  end
end
