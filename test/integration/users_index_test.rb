require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin     = users(:denis)
    @non_admin = users(:grigory)
  end

  test "index including pagination and delete links" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page_of_user = User.paginate(page: 1)
    first_page_of_user.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', users_path(user), text: 'delete'
                                                     method: :delete
      end
    end
    assert_difference 'User.count' do
      delete user_path(@non_admin)
    end
  end

end
