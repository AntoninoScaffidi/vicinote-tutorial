# price_cents is what's stored and compared (no float rounding surprises),
# but nobody wants to type cents into a form. This speaks euros on the way
# in and out, so a form field can just be "price". Shared by Service and
# Booking now that both have their own price_cents column.
module Priceable
  extend ActiveSupport::Concern

  def price
    price_cents && price_cents / 100.0
  end

  def price=(value)
    self.price_cents = value.present? ? (value.to_f * 100).round : nil
  end
end
