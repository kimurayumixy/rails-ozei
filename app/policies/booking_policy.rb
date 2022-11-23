class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(bookings: { user: user})
    end
  end
  def create?
    true
  end
  def update?
    user == record.user
  end
end
