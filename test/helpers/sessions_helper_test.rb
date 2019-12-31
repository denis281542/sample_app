require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

    def setup
      @user = users(:denis)
      remember(@user)
    end

    test "current user returns right user when session is nil" do
      assert_equal @user, current_user
      assert is_logget_in?
    end