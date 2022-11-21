class Restaurant < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
<<<<<<< HEAD

=======
>>>>>>> fd3c78172bf885c8843884d7463d1d5cadf74824
  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true, uniqueness: true
  validates :availability, presence: true
end
