class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :hotel_name
      t.date :date

      t.timestamps
    end
  end
end
