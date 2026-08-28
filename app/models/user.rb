class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :bookings, foreign_key: :customer_id, dependent: :destroy, inverse_of: :customer
  has_many :received_bookings, through: :services, source: :bookings

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
