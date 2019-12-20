require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "exampleuser@email.com")
  end

  test "should be valid" do
    assert @user.valid? 
  end
end
