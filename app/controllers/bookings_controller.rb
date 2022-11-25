class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    @tags = Restaurant::MOODS
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.new
    @booking.restaurant = @restaurant
    @booking.user = current_user
    @booking.number_of_people = (params[:booking][:number_of_people]).to_i
    @booking.status = "pending"
    authorize @booking
    if @booking.save
      RestaurantChannel.broadcast_to(
        @restaurant.user,
        {
          partial: render_to_string(partial: "owner/bookings/card_product", locals: { booking: @booking }),
          action: "create",
          id: @booking.id
        }

      )
      redirect_to bookings_path
    else
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @restaurant = @booking.restaurant
    @user = current_user
    authorize @booking
    if @booking.update(booking_params)
      bookings = current_user.bookings.where(status: %w[pending restaurant_accepted])
      bookings.update_all(status: "user_rejected")
      RestaurantChannel.broadcast_to(
        @restaurant.user,
      {
        partial: render_to_string(partial: "owner/bookings/card_product", locals: { booking: @booking }),
        action: "update",
        id: @booking.id
      }
    )
      redirect_to restaurant_path(@restaurant)
    else
      render :index
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :number_of_people)
  end
end
