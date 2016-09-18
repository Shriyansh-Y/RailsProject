class Member < ActiveRecord::Base
  has_many :bookings
  validates :email, :name, :password, presence: true
  validates_uniqueness_of :email
end
