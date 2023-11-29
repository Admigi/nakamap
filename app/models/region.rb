class Region < ApplicationRecord
  has_many :pins

  validates :name, presence: true
  validates :description, presence: true
end
