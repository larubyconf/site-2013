require "minitest_helper"

class ClicksControllerTest < MiniTest::Rails::ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
