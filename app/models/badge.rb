class Badge < ApplicationRecord
  has_many :userbadges
  has_many :users, through: :userbadges

  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
end