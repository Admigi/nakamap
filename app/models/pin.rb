class Pin < ApplicationRecord
  belongs_to :post
  belongs_to :categorie
  belongs_to :region
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
