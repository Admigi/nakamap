class Pin < ApplicationRecord
  has_one :post
  belongs_to :categorie
  belongs_to :region

  validates :name, presence: true
  validates :description, presence: true
  validates :longitude, presence: true, uniqueness: true
  validates :latitude, presence: true, uniqueness: true
end
