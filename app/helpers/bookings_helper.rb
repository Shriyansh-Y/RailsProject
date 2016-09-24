module BookingsHelper

  SEVEN_DAYS_SECONDS = 604800

  def endTime
    current_time = Time.new
    current_time+= SEVEN_DAYS_SECONDS
    #[current_time.year, current_time.strftime("%B"), current_time.day]
  end

end
