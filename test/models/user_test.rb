require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", emall: "user@example.com",
    password:"foobar",password_confirmation:"foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "emall should be present" do
    @user.emall = "  "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "emall should not be too long" do
    @user.emall = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "emall validation should accept valid addresses" do
        invalid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
        first.last@foo.jp alice+bob@baz.cn]
    invalid_addresses.each do |invalid_address|
      @user.emall = invalid_address
      assert_not @user.invalid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "emall addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.emall=@user.emall.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank) " do
    @user.password =@user.password_confirmation = ""*6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password=@user.password_confirmation="a"*5
    assert_not@user.valid?
  end

  test "authenticated? should return false for a user with nil degest" do
    assert_not @user.authenticated?('')
  end
end