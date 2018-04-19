require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

    def setup
      @user = User.create!(name: 'login-test', password: 'AAAAAA', email: 'abc@gmail.com', languages: [languages(:deutsch)], country: countries(:deutschland))
    end
    
    def 


    def tear_down
      @user.destroy
    end

    test "login with invalid information" do
      get login_path
      post login_path, params: { session: { nameoremail: "", password: "" } }
      assert_not flash.empty?
      get root_path
      assert flash.empty?
    end

    test "login with remembering" do
      log_in_as(@user)
      assert_same(cookies.signed['user_id'], @user.id)
      assert(@user.authenticate?(cookies['remember_token']))
    end

    test "multiple devices log in" do
      # Log in to set the cookie.
      log_in_as(@user)
      tmp = @user.remember_digest;
      log_in_as(@user)
      assert_equal(tmp, @user.remember_digest)
      # Log in again and verify that the cookie is deleted.
    end

end
