class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  before_action :set_restaurant, only: [:show]
  before_action :restaurant_moods, only: [:index]

  def index
    if params[:query].present?
      @restaurants = policy_scope(Restaurant).search(params:[query])
    else
      @restaurants = policy_scope(Restaurant)
    end
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
    @moods = ["Hip", "Casual", "Relaxing", "Party", "Chill", "Energetic", "Modern"]
  end
end
