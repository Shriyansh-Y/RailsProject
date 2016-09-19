class Member < ActiveRecord::Base
  has_many :bookings
  #TODO - Validation for the email structure and case.
  validates :email, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :password, presence: true, length: { minimum: 5 }
  validates_uniqueness_of :email
  has_secure_password
  #TODO Validate if the value of the passwords are the same 
end
