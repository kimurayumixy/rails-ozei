class Owner::BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:restaurant).where(restaurants: { user: user})
    end
  end
  def update?
    record.user == user
  end
end
