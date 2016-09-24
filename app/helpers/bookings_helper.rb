module BookingsHelper

  SEVEN_DAYS_SECONDS = 604800
  VALID_HOUR_VALUES = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22]

  MONTH_ID_TO_MONTH = { 1 => "January",
                        2 => "February",
                        3 => "March",
                        4 => "April", 
                        5 => "May",
                        6 => "June",
                        7 => "July",
                        8 => "August",
                        9 => "September",
                        10 => "October",
                        11 => "November",
                        12 => "December"}

  
  # Returns the 
  # 1) Array of years to be used
  # 2) Array of months to be used
  # 3) Array of days to be used
  # 4) Array of hours to be used. - TODO - Prevent the user from selecting
  # a past hour for the current day.
  def start_and_end_time
    current_time = Time.new
    end_time = current_time + SEVEN_DAYS_SECONDS
    years = [current_time.year, end_time.year].uniq
    end_time.end_of_month.day
    end_time.day

    days = []
    if current_time.month != end_time.month
      months = [[current_time.strftime("%B"), current_time.month], 
        [end_time.strftime("%B"), end_time.month]]

      # Add all the indexes from the current date to the end of the month.
      (current_time.day .. current_time.end_of_month.day).each do |day|
        days << day
      end

      # add all the indexes from the start of the month to the end day.
      (1 .. end_time.day).each do |day|
        days << day
      end

    else
      months = [[current_time.strftime("%B"), current_time.month]]
      (current_time.day .. end_time.day).each do |day|
        days << day
      end
    end

    # TODO - Do not include the current day if current time is over 
    # the last interval of the day. Add otherwise.
    if current_time.hour > 22
      days.delete(current_time.day)
    end
    return years, months, days, VALID_HOUR_VALUES
  end

  # method for validating the time inputs that are provided for new
  def time_validator
  end

  # To merge all the time and date variable to a single string
  def convert_time_to_dateTime (booking)
    "#{booking.booking_start_day}-#{MONTH_ID_TO_MONTH[booking.booking_start_month]}-#{booking.booking_start_year} at 
     #{booking.booking_start_hour}:00"
  end
end
