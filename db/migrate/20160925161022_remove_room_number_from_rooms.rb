class RemoveRoomNumberFromRooms < ActiveRecord::Migration
  def change
    remove_column :rooms, :room_number, :string
  end
end
