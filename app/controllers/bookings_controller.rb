class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.new
    @booking.restaurant = @restaurant
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @restaurant = @booking.restaurant
    authorize @booking
    if @booking.update(booking_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :index
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status)
  end
end
