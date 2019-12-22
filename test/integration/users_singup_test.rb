require 'test_helper'

class UsersSingupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get singup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: " ", 
                               email: "user@invalid", 
                               passord:               "foo", 
                               password_confirmation: "bar" } } 
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
  get singup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                          email: "user@example.com",
                                          password:              "password",
                                          password_confirmation: "password" } } 
      follow_redirect!
    end
    assert_template 'users/show'
  end

end
