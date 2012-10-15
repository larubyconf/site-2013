require "minitest_helper"

class TravelsControllerTest < MiniTest::Rails::ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
