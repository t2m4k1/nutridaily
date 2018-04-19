ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all


  # Returns true if a test user is logged in.
  def is_logged_in?
      session[:authentication_id].nil?
  end

  # Log in as a particular user.
  def log_in_as(user)
    session[:authentication_id] = user.authentication_id;
  end
end

class ActionDispatch::IntegrationTest
  def log_in_as(user, password, remember_me: '1')
    post login_path, params: { session: { nameoremail: user.email, password: password, remember_me: remember_me } }
  end
end
