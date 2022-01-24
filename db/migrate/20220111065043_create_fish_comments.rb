class CreateFishComments < ActiveRecord::Migration[5.2]
  def change
    create_table :fish_comments do |t|
      t.integer :user_id
      t.integer :fish_id
      t.text :comment

      t.timestamps
    end
  end
end
