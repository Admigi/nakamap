class Badge < ApplicationRecord
  has_many :userbadges

  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true, uniqueness: true
end
