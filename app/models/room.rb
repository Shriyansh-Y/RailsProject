class Room < ActiveRecord::Base
  has_many :bookings
  validates :room_number, :capacity, :building, presence: true
end
