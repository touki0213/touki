require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user=users(:michael)
    @other_user=users(:archer)
  end

  test "should redirect index when not logged in"  do
    get users_path
    assert_redirected_to login_url
  end

  test "should redirect when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user),params:{user:{name:@user.name,
      emall:@user.emall
    }}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count'do
    delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin"do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end

end