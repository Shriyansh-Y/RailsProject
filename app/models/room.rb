class Room < ActiveRecord::Base
  has_many :bookings
  validates :room_number, :capacity, :building, presence: true
  validates_uniqueness_of :room_number, :scope => [:building]
end
