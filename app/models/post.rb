class Post < ApplicationRecord
  has_one :pin

  validates :content, presence: true
  validates :multimedia, presence: true
end
