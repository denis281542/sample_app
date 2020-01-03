require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:denis)
  end
  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template "users/edit"
    patch user_path(@user), params: { user: { name: "",
                                    email: "ya@ya.",
                                    password: "pas",
                                    password_confirmation: "word" } }
    assert_template "users/edit"                                
  end

  test "seccessful edit" do
    get edit_user_path(@user)
    assert_template "users/edit"
    name = Den
    email = den@mail.ru
    patch user_path(@user), params: { user: { name: name,
                                               email: email,
                                               password: "",
                                               password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email
  end
end
