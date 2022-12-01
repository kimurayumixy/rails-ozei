class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  before_action :set_restaurant, only: [:show]

  def index
    @restaurants =
      if params[:query].present?
        # CHANGE NEAR VALUE TO 5KM
        policy_scope(Restaurant).search(params[:query]).geocoded
      elsif params[:lat].present? && params[:long].present?
        # CHANGE NEAR VALUE TO ADJUST SEARCH RANGE
        @location = [params[:lat], params[:long]]
        policy_scope(Restaurant).near([params[:lat].to_f, params[:long].to_f], 10, order: 'distance')
      else
        policy_scope(Restaurant)
      end
    @markers = @restaurants.geocoded.map do |restaurant| {
      lat: restaurant.latitude,
      lng: restaurant.longitude,
      info_window: render_to_string(partial: "info_window", locals: {restaurant: restaurant})
    }
    end
    @tags = restaurant_moods
    @restaurants = @restaurants.where('maximum_number >= ?', params[:group_size]) if params[:group_size].present?
    @restaurants = @restaurants.tagged_with(params[:tag_list]) if params[:tag_list]&.any?
    @booking = Booking.new
    @group_size = params[:group_size]
    @input = params[:query]
  end

  def show
    @booking = Booking.new
    @restaurant.bookings.each do |booking|
      if booking.user == current_user && booking.status == "user_accepted"
        @user_confirmed = true
      end
    end
    @tags = Restaurant::MOODS
    authorize @restaurant
    @markers = [{
      lat: @restaurant.latitude,
      lng: @restaurant.longitude,
      info_window: render_to_string(partial: "info_window", locals: {restaurant: @restaurant})
    }]
  end

  private

  def restaurant
    params.require(:restaurant).permit(:name, :description, :tags_list)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_moods
    @moods = Restaurant::MOODS
  end
end
