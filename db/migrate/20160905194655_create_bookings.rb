class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :room_id
      t.integer :member_id
      t.datetime :booking_start

      t.timestamps null: false
    end
  end
end
