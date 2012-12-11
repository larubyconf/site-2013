require "minitest_helper"

class VoteTest < MiniTest::Rails::ActiveSupport::TestCase
  test "vote requires proposal and user" do
    v = Vote.new

    assert !v.valid?
    v.user_id = 1
    assert !v.valid?
    v.proposal_id = 1
    assert v.valid
  end
  
  # test "the truth" do
  #   assert true
  # end
end
