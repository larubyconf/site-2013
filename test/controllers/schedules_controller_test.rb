require "minitest_helper"

class SchedulesControllerTest < MiniTest::Rails::ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
