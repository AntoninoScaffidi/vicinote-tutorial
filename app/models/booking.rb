class Booking < ApplicationRecord
  include Priceable

  belongs_to :service
  belongs_to :customer, class_name: "User"

  validates :scheduled_on, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending confirmed completed cancelled] }
  validates :price_cents, presence: true, numericality: { greater_than: 0, only_integer: true }

  validate :customer_is_not_the_provider

  private

  def customer_is_not_the_provider
    return unless service && customer_id

    errors.add(:customer, "can't book their own service") if service.user_id == customer_id
  end
end
