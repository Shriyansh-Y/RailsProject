class Room < ActiveRecord::Base
  has_many :bookings
  validates :room_number, :capacity, :building, presence: true

  def self.search(search)
    where("room_number LIKE ? OR capacity LIKE ? OR building LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
  validates_uniqueness_of :room_number, :scope => [:building]

  BUILDING_HASH={0=>'D.H.Hill', 1=>'James.B.Hunt'}
  def get_building (building_id)
    BUILDING_HASH[building_id]
  end

  def get_building_for_self
    BUILDING_HASH[self.building]
  end
  def get_name_building
    "#{self.room_number} at #{get_building self.building} with size #{self.capacity}"
  end

end
