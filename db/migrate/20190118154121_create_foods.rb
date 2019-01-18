class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer :location_x
      t.integer :location_y
      t.integer :hunger_decrease

      t.timestamps
    end
  end
end
