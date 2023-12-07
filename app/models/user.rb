class User < ApplicationRecord
  has_many :userbadges, foreign_key: :user_id
  has_many :badges, through: :userbadges
  has_many :bookmarks, dependent: :destroy
  has_one_attached :image_url

  def self.top_users(limit)
    # Assuming you have a 'points' attribute
    where.not(points: nil).order(points: :desc).limit(limit)
  end
  # validates :username, uniqueness: true, presence: true, length: { minimum: 3}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end

