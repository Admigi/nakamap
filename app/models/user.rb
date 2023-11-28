class User < ApplicationRecord

  has_many :userbadges


  validates :username, uniqueness: true, presence: true, length: { minimum: 3, maximum: 50 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
