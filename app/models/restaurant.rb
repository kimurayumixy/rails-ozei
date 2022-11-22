class Restaurant < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true, uniqueness: true
  validates :availability, presence: true
end
