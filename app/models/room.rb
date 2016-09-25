class Room < ActiveRecord::Base
  has_many :bookings
  validates :room_number, :capacity, :building, presence: true

  def self.search(search)
    where("room_number LIKE ? OR capacity LIKE ? OR building LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
