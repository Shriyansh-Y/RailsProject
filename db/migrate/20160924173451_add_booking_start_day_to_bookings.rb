class AddBookingStartDayToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :booking_start_day, :integer
  end
end
