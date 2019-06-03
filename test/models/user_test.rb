require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def　setup
    @user=User.new(name:"Exampl User",emall:"user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name="  "
    assert_not user.valid?
  end

  test "emall should be present" do
    @user.emall=""
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name="a"*51
    assert_not @user.valid?
  end

  test "emall should not be too long" do
    @user.emall= "a" *244+"@example.com"
    assert_not @user.valid?
  end

  test "emall validation should accept valid addresses" do
    valid_addresses=%w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
    first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.emall=valid_addresses
      assert @user.valid?,"#{valid_address.inspect} should be valid"
    end
  end
end
