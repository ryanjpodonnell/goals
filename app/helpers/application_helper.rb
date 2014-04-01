module ApplicationHelper
  def authenticate
    redirect_to new_session_url unless logged_in?
  end


  def logged_in?
    !!current_user
  end

  def current_user
    return nil unless session[:token]
    # fail
    User.find_by_token(session[:token])
  end

  def checked(goal)
    if goal.complete
      "<img src=\"http://www.clker.com/cliparts/c/b/J/b/6/s/check-mark-yellow-md.png\" width=\"50\" height=\"50\">".html_safe
    else
      nil
    end
  end
end
