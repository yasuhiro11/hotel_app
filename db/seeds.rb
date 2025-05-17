# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Property.find_or_create_by!(title: "大阪プレミアムホテル") do |p|
  p.description = "大阪にある高級ホテルです。"
  p.price = 8232
end

Property.find_or_create_by!(title: "東京ラグジュアリーホテル") do |p|
  p.description = "東京にあるラグジュアリーホテルです。"
  p.price = 12431
end

Property.find_or_create_by!(title: "札幌ビューホテル") do |p|
  p.description = "札幌の絶景を楽しめるホテルです。"
  p.price = 12468
end
