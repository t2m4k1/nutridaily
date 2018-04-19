ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  # Returns true if a test user is logged in.
  def is_logged_in?
      @user = User.find(cookies.signed['user_id'])
      @user.authenticated?(cookies['remember_token'])
  end

  # Log in as a particular user.
  def log_in_as(user)
    user.remember()
    cookies.permanent.signed['user_id'] = user.id
    cookies.permanent['remember_token'] = user.remember_token
  end
end

class ActionDispatch::IntegrationTest

  # Log in as a particular user.
  def log_in_as(user, password: 'password')
    post login_path, params: { session: { nameoremail: user.email, password: password } }
  end
end
