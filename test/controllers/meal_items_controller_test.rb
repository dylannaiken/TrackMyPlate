require "test_helper"

class MealItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get meal_items_new_url
    assert_response :success
  end
end
