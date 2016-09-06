class Member < ActiveRecord::Base
  has_many :bookings
  validates :email, presence: true
  validates :name, presence: true
end
