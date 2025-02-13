require "test_helper"

class NutritionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nutrition_index_url
    assert_response :success
  end

  test "should get show" do
    get nutrition_show_url
    assert_response :success
  end
end
