class AddBookingStartMonthToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :booking_start_month, :integer
  end
end
