class Member < ActiveRecord::Base
  has_many :bookings
  EMAIL_REGEX = /[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+/
  validates :email, presence: true, length: { maximum: 20 }, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :name, presence: true, length: { maximum: 20 }
  validates :password, presence: true, length: { minimum: 5 }
  validates_uniqueness_of :email
  has_secure_password
  before_save { self.email = email.downcase }
end
