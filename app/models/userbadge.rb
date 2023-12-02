class Userbadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  validates :name, presence: true
  validates :description, presence: true
end