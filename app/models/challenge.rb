class Challenge < ApplicationRecord
    serialize :metadata, JSON
    store_accessor :metadata, :selected_options
    has_many :options, dependent: :destroy
    validates :name, presence: true, uniqueness: true
end
