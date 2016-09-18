class Member < ActiveRecord::Base
  has_many :bookings
  validates :email, :name, :password, presence: true
end
