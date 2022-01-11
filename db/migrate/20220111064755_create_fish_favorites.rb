class CreateFishFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :fish_favorites do |t|
      t.integer :user_id
      t.integer :fish_id

      t.timestamps
    end
  end
end
