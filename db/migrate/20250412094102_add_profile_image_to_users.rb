class AddProfileImageToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :profile_image, :string
  end
end
