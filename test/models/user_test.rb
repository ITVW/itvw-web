require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # user
  def setup
    @carrier =  Carrier.new(name: "AT&T", email_address:"@txt.att.net")
    
    @user =     User.new(carrier: @carrier, phone: "1234567890",
                         nickname: "SYNEFELD")
  end
  
  # user
  test "should be valid" do
    assert @user.valid?
  end
  
  # user.phone
  test "phone should be present" do
    @user.phone = "   "
    assert_not @user.valid?
  end
  
  test "phone should not be too long" do
    @user.phone = "0123456789012345"
    assert_not @user.valid?
  end
  
  test "phone number should only have numbers" do
    numbers = %w[A1234567890 +1-541-754-3010 (800)867-5309]
    numbers.each do |number|
      @user.phone = number
      assert_not @user.valid?,
      "#{number.inspect} should be an invalid phone number"
    end
  end
  
  test "phone number should be valid" do
    numbers = %w[12481234567 821012345678 27821234567 448489123456]
    numbers.each do |number|
      @user.phone = number
      assert @user.valid?,
      "#{number.inspect} should be a valid phone number"
    end
  end
  
  test "phone number should be unique" do
    duplicate = @user.dup
    duplicate.nickname = "NOTSYNEFELD"
    @user.save
    assert_not duplicate.valid?
  end
  
  # user.nickname
  test "nickname should be present" do
    @user.nickname = "   "
    assert_not @user.valid?
  end
  
  test "nickname should not be too long" do
    @user.nickname = "a" * 21
    assert_not @user.valid?
  end
  
  test "nickname should not have unallowed characters" do
    @user.nickname = "JERRY_SYNEFELD"
    assert_not @user.valid?
  end
  
  test "nickname should be valid" do
    nicknames = %w[JERRY SYNEFELD spriteLover420 virtualSeapunk]
    nicknames.each do |nickname|
      @user.nickname = nickname
      assert @user.valid?
    end
  end
  
  test "nickname should be unique" do
    duplicate = @user.dup
    duplicate.phone = "0987654321"
    duplicate.nickname = @user.nickname.downcase
    @user.save
    assert_not duplicate.valid?
  end
end
