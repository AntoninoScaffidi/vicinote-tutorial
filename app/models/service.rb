class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true
  validates :price_cents, presence: true, numericality: { greater_than: 0, only_integer: true }

  # price_cents is what's stored and compared (no float rounding surprises),
  # but nobody wants to type cents into a form. This speaks dollars on the
  # way in and out, so the form field can just be "price".
  def price
    price_cents && price_cents / 100.0
  end

  def price=(value)
    self.price_cents = value.present? ? (value.to_f * 100).round : nil
  end
end
