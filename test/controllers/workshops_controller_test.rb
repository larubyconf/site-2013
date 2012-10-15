require "minitest_helper"

class WorkshopsControllerTest < MiniTest::Rails::ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
