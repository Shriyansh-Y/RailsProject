module ApplicationHelper
  def logged_in?
    !session[:id].nil?
  end
  def log_in id
    if !logged_in?
      session[:id] = id
    end
  end
  def redirect_if_not_logged_in
    if !logged_in?
      redirect_to trackers_login_path
    end
  end
  def logged_in_user
    !session[:id].nil? && Member.find(session[:id])
  end
  def redirect_to_home_if_logged_in
    if logged_in?
      @member=Member.find(session[:id])
      redirect_to @member
    end
  end
  def redirect_to_home_if_not_admin
    if logged_in?
      @member=Member.find(session[:id])
      if !@member.admin
        redirect_to @member
      end
    end
  end

  def base_time_for_slot 
    current_time = Time.new
    # The following code logic will set the current hour to the previous 
    # time slot. For example, 13 is set to 12 and 6 is set to 6.
    return current_time.year, current_time.month, current_time.day, current_time.hour - (current_time.hour % 2)
  end

  # method for validating the time inputs that are provided are not
  # past time and date.
  def time_validator (year, month, day, hour)
    slot_year, slot_month, slot_day, slot_hour = base_time_for_slot
    return (Time.new(slot_year, slot_month, slot_day, slot_hour) <=
            Time.new(year, month, day, hour))
  end
end
