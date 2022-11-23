class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:owner, Booking])
    @restaurants = current_user.restaurants if current_user.restaurants.any?
  end

  def update
    @booking = Booking.find(params[:id])
    authorize [:owner, @booking]
    if @booking.update(booking_params)
      redirect_to owner_bookings_path
    else
      render :index, status: unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status)
  end
end
