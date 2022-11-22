class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:ower, Booking])
    @restautants = current_user.restautants if current_user.restautants
  end

  def update
    @booking = Booking.find(param[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to owner_bookings_path
    else
      render "owner/bookings", status: unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:restaurant)
  end
end
