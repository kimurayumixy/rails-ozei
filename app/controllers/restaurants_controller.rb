class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  before_action :set_restaurant, only: [:show]

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show
    authorize @restaurant
  end

  private

  def restaurant
    params.require(:restaurant).permit(:name)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
