require 'test_helper'

class SingupTest < ActionDispatch::IntegrationTest
  test "singup path" do
    get singup_path
    assert_template 'users/new'
    #assert_select "title", "Sing up | #{@base_title}"
  end
end
