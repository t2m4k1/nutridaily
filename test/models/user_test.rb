require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @language = languages(:deutsch)
    @country = countries(:deutschland)
    @user = User.new(name: "Example User", password: "ABCDEF", email: "user@example.com", country: @country)
    @user.languages << @language
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "language should be present" do
    @user.languages = nil;
    assert_not @user.valid?
  end

  test "country should be present" do
    @user.country = nil;
    assert_not @user.valid?
  end


  test "password should be present" do
    @user.password = "     "
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end


end
