# 1) シード用ユーザー取得 or 作成
seed_user = User.find_or_create_by!(email: "seed@example.com") do |u|
  u.password = "password123"
  # （必要なら name や他の必須カラムをここで設定）
end

# 2) 既存データをいったん削除（重複防止）
Property.where(user: seed_user).delete_all

# 3) 10件まとめて作成
cities = [ "札幌", "東京", "大阪", "京都" ]
types  = [ "ホテル", "ゲストハウス", "旅館" ]
10.times do |i|
  Property.create!(
    title:            "サンプル宿泊施設#{i + 1}",
    city:             cities.sample,
    country:          "日本",
    price_per_night:  rand(5_000..30_000),
    property_type:    types.sample,
    user:             seed_user
  )
end

puts "✅ 10件のPropertyを作成しました"

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
