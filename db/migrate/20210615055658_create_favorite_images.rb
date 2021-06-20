class CreateFavoriteImages < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_images do |t|
      t.integer :user_id
      t.integer :picture_id

      t.timestamps
    end
  end
end
