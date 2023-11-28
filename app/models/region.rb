class Region < ApplicationRecord
  has_many :pins

  validates :name, presence: true
  validates :description, presence: true
  validates :longitude, presence: true, uniqueness: true
  validates :lattitude, presence: true, uniqueness: true
end
