class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(bookings: { user: user})
    end
  end
  def index?
    true
  end
  def create?
    true
  end
  def update?
    user == record.user || record.restaurant.user == user
  end
end
