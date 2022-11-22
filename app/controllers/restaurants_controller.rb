class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  before_action :set_restaurant, only: [:show]
  before_action :restaurant_moods, only: [:index]

  def index
    @restaurants =
      if params[:query].present?
        policy_scope(Restaurant).search(params[:query])
      else
        policy_scope(Restaurant)
      end

    @tags = restaurant_moods
    @restaurants = @restaurants.tagged_with(params[:tags]) if params[:tags]&.any?
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
