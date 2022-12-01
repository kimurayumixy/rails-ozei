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
    @booking.distance = (params[:booking][:distance])
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
      # redirect_to restaurants_path
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
      # raise
      RestaurantChannel.broadcast_to(
        @restaurant.user,
        {
          partials: [
            render_to_string(partial: "owner/bookings/tab_content", locals: { bookings: @restaurant.bookings.pending}),
            render_to_string(partial: "owner/bookings/tab_content", locals: { bookings: @restaurant.bookings.restaurant_accepted}),
            render_to_string(partial: "owner/bookings/tab_content", locals: { bookings: @restaurant.bookings.user_accepted}),
          ],
          action: "update",
        }
      )
      if @booking.status == "user_accepted"
        redirect_to restaurant_path(@restaurant)
      elsif @booking.status == "user_rejected"
        redirect_to bookings_path
      end
    else
      render :index
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :number_of_people, :distance)
  end
end
