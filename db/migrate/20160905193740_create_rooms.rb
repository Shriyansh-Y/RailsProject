class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.integer :capacity
      t.integer :building

      t.timestamps null: false
    end
  end
end
