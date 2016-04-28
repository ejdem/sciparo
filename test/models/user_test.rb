require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Test")
  end
  
  test "new user should be valid" do
    assert @user.valid?
  end
  
  test "new user name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
end
