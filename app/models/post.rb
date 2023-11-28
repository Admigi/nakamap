class Post < ApplicationRecord
  belongs_to :pin

  validates :content, presence: true
  validates :multimedia, presence: true
end
