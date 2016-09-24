class AddBookingStartYearToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :booking_start_year, :integer
  end
end
