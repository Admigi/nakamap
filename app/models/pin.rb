class Pin < ApplicationRecord
  has_one :post
  belongs_to :categorie
  belongs_to :region
end
