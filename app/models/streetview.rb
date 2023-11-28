class Streetview < ApplicationRecord
  belongs_to :post

  validates :street_url, presence: true
  validates :audio_url, presence: true
end
