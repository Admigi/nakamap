class User < ApplicationRecord
  has_many :userbadges, foreign_key: :user_id
  has_many :badges, through: :userbadges
  has_one_attached :image_url

  # validates :username, uniqueness: true, presence: true, length: { minimum: 3}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
