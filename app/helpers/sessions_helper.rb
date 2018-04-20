module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:authentication_id] = user.authentication_id
  end
  
 def remember(user)
    cookies.signed[:authentication_id] = user.authentication_id
    cookies.signed[:remember_token] = user.append_remember
 end

 def forget(user)
    user.forget_token(cookies.signed[:remember_token])
    cookies.delete(:authentication_id)
    cookies.delete(:remember_token)
 end

  # Returns the user corresponding to the remember token cookie.
 def current_user
    if (authentication_id = session[:authentication_id])
      @current_user ||= User.find_by(authentication_id: authentication_id)
    elsif (authentication_id = cookies.signed[:authentication_id])
      user = User.find_by(authentication_id: authentication_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.

  def log_out
    @current_user.forget_token(cookies.signed[:remember_token])
    @current_user = nil
    session.delete(:authentication_id)
    cookies.delete :authentication_id
    cookies.delete :remember_token
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  
  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
