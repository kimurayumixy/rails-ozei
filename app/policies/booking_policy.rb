class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
    def index?
      true
    end
    def create?
      true
    end
    def update?
      record.user == user
    end
  end
end
