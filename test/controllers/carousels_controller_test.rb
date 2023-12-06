require "test_helper"

class CarouselsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get carousels_show_url
    assert_response :success
  end
end
