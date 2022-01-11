class CreateFishes < ActiveRecord::Migration[5.2]
  def change
    create_table :fishes do |t|
      t.integer :user_id
      t.string :image_id
      t.string :fish_name
      t.string :lure
      t.text :body

      t.timestamps
    end
  end
end
