class Member < ActiveRecord::Base
  has_many :bookings
  validates :email, :name, :password, presence: true
  validates_uniqueness_of :email
  #TODO Validate if the value of the passwords are the same 
end
