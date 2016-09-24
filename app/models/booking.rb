class Booking < ActiveRecord::Base
  belongs_to :member
  belongs_to :room
  validates :member_id, presence: true
  validates :room_id, presence: true
  validates_uniqueness_of :room_id, :scope => [:booking_start_year, :booking_start_month, :booking_start_day, :booking_start_hour]

  # Validation is not added for the booking time
  # as the drop down is presented to the user and hence
  # the user will not be able to input wrong values.
end
