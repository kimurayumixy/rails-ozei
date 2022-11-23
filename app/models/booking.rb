class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :number_of_people, presence: true
  enum status: { pending: 0, restaurant_accepted: 1, restaurant_rejected: 2, user_accepted: 3, user_rejected: 4 }
end
