module ApplicationHelper
  def logged_in?
    !session[:id].nil?
  end
  def redirect_if_not_logged_in
    if !logged_in?
      redirect_to welcomes_login_path
    end
  end
end
