class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.string :property_type
      t.integer :room_count
      t.integer :max_guests
      t.decimal :price_per_night
      t.float :latitude
      t.float :longitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
