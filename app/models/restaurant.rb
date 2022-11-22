class Restaurant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many_attached :photos
  belongs_to :user
  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true, uniqueness: true
  validates :availability, presence: true
end
