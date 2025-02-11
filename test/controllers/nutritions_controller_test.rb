require "test_helper"

class NutritionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nutritions_index_url
    assert_response :success
  end

  test "should get show" do
    get nutritions_show_url
    assert_response :success
  end
end
