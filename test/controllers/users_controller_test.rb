require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:denis)
    @other_user = users(:grigory)
  end

  test "should get new" do
    get singup_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logget in" do
    patch '/users/update', params: { id: @user.id, user: { name: @user.name, email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end
  

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_url(@user), params: { id: @user.id, user: { name: @user.name, email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end


end
