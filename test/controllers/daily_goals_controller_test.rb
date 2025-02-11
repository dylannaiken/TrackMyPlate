require "test_helper"

class DailyGoalsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get daily_goals_edit_url
    assert_response :success
  end
end
