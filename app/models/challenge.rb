class Challenge < ApplicationRecord
    serialize :metadata, JSON
    store_accessor :metadata, :selected_options
    has_many :bookmarks, dependent: :destroy
end
