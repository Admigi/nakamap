class Pin < ApplicationRecord
  has_one :post
  belongs_to :categorie
  belongs_to :region

  validates :name, presence: true
  validates :description, presence: true
  
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
