class Owner::BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:restaurant).where(restaurants: { user: user})
    end
  end
  def update?
    # raise
    true
    # record.restaurant.user == user
  end
end
