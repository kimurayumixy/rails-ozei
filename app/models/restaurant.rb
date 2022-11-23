class Restaurant < ApplicationRecord
  MOODS = ["Hip", "Casual", "Relaxing", "Party", "Chill", "Energetic", "Modern", "Fancy"]

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_taggable_on :tags
  has_many_attached :photos
  belongs_to :user
  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true, uniqueness: true
  validates :availability, presence: true

  include PgSearch::Model
  pg_search_scope :search, against: [:address, :name],
  using: {
    tsearch: { prefix: true }
  }
end
