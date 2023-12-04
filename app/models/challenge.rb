class Challenge < ApplicationRecord
    serialize :metadata, JSON
    store_accessor :metadata, :selected_options
end
