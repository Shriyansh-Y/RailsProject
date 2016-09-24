class RemoveBookingStartFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :booking_start, :datetime
  end
end
