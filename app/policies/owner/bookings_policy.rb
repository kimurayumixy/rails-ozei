class Owner::BookingsPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:booking).where(bookings: {user_id: current_user})
    end
  end
end
