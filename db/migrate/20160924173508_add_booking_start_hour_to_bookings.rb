class AddBookingStartHourToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :booking_start_hour, :integer
  end
end
