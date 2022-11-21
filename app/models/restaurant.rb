class Restaurant < ApplicationRecord
  has_many_attached :photos

  # validates :name, presence: true
  # validates :cateogory, presence: true
  # validates :address, presence: true
  # validates :longitude, presence: true
  # validates :latitude, presence: true
  # validates :availability, presence: true

end
