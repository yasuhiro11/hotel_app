class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.integer :capacity
      t.integer :bed_count
      t.decimal :price_per_night
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
