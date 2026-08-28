class ServicesController < ApplicationController
  allow_unauthenticated_access only: %i[index show]

  def index
    @services = Service.includes(:category, :user).order(created_at: :desc)
  end

  def show
    @service = Service.includes(:category, :user).find(params[:id])
    @booking = Booking.new
  end

  def new
    @service = Current.user.services.new
  end

  def create
    @service = Current.user.services.new(service_params)

    if @service.save
      redirect_to services_path, notice: "Your service is live."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def service_params
    params.require(:service).permit(:title, :description, :price, :category_id)
  end
end
