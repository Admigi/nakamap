# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

regions = Region.create([
  { name: 'Hokkaido', latitude: 43.0646, longitude: 141.3468 },
  { name: 'Tohoku', latitude: 38.2655, longitude: 140.8694 },
  { name: 'Kanto', latitude: 35.6895, longitude: 139.6917 },
  { name: 'Chubu', latitude: 36.2048, longitude: 138.2529 },
  { name: 'Kansai', latitude: 34.6937, longitude: 135.5023 },
  { name: 'Chugoku', latitude: 34.6681, longitude: 133.9182 },
  { name: 'Shikoku', latitude: 33.8456, longitude: 132.7656 },
  { name: 'Kyushu', latitude: 32.8032, longitude: 130.7079 }
])