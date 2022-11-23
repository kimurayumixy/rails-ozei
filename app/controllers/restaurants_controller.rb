class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  before_action :set_restaurant, only: [:show]
  require 'net/http'
  require 'uri'
  require 'json'

  def index
    key = "eb23cb3ca1015ddc"
    lat = '35.658'
    lng = '139.7016'
    range = 1
    api = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{key}&large_area=Z011&format=json")
    json = Net::HTTP.get(api)
    parseResult = JSON.parse(json)
    @result = parseResult["results"]["shop"]

    @restaurants =
      if params[:query].present?
        policy_scope(Restaurant).search(params[:query])
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
    @restaurants = @restaurants.tagged_with(params[:tags]) if params[:tags]&.any?
    @booking = Booking.new
  end

  def show
    authorize @restaurant
  end

  private

  def restaurant
    params.require(:restaurant).permit(:name, :tags_list)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_moods
    @moods = Restaurant::MOODS
  end
end
