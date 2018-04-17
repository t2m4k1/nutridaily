module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if @current_user.nil?
        if (user_id = cookies.signed[:user_id])
          user = User.find_by(id: user_id)
          if user && user.authenticated?(cookies[:remember_token])
            @current_user = user
          end
        end
    else
        @current_user
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  def log_out
    @current_user = nil
    cookies.delete :user_id
    cookies.delete :remember_token
  end
end
