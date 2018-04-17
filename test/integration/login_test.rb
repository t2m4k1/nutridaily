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
      log_in_as(@user, remember_me: '1')
      assert_not_empty cookies['remember_token']
    end

    test "login without remembering" do
      # Log in to set the cookie.
      log_in_as(@user)
      # Log in again and verify that the cookie is deleted.
      log_in_as(@user)
      assert_empty cookies['remember_token']
    end

end
