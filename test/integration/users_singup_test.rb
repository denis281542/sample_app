require 'test_helper'

class UsersSingupTest < ActionDispatch::IntegrationTest
  test "" do
    get singup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "", 
                               email: "user@invalid", 
                               passord: "foo", 
                               password_confirmation: "bar" }  
    end
    assert_template 'users/new'
  end
end
