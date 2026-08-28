class Service < ApplicationRecord
  include Priceable

  belongs_to :user
  belongs_to :category
  has_many :bookings

  validates :title, presence: true
  validates :description, presence: true
  validates :price_cents, presence: true, numericality: { greater_than: 0, only_integer: true }
end
