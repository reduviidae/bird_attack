class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :name
      t.string :password
      t.integer :hp
      t.integer :hunger
      t.boolean :sickness, default: false
      t.integer :location_x
      t.integer :location_y

      t.timestamps
    end
  end
end
