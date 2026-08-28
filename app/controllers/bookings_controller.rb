class BookingsController < ApplicationController
  def index
    @my_bookings = Current.user.bookings.includes(:service).order(scheduled_on: :asc)
    @received_bookings = Current.user.received_bookings.includes(:service, :customer).order(scheduled_on: :asc)
  end

  def create
    service = Service.find(params[:service_id])
    booking = Current.user.bookings.new(booking_params.merge(service: service, price_cents: service.price_cents))

    if booking.save
      redirect_to bookings_path, notice: "Booked for #{booking.scheduled_on}."
    else
      redirect_to service_path(service), alert: booking.errors.full_messages.to_sentence
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:scheduled_on)
  end
end
