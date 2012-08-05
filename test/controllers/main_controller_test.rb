require "minitest_helper"

class MainControllerTest < MiniTest::Rails::ActionController::TestCase
  test "index should render a page" do
    get :index
    assert_response :success
  end

end
