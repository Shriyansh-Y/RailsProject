module ApplicationHelper
  def log_in id
    session[:id] = id
  end
  def logged_in?
    !session[:id].nil?
  end
  def redirect_if_not_logged_in
    if !logged_in?
      redirect_to trackers_login_path
    end
  end
  def redirect_to_home_if_logged_in
    if logged_in?
      @member=Member.find(session[:id])
      redirect_to @member
    end
  end
end
