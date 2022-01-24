class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.integer :fish_id
      t.float :latitude
      t.float :longitude
      t.string :name

      t.timestamps
    end
  end
end
