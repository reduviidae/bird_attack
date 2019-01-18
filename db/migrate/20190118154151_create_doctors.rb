class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.integer :location_x
      t.integer :location_y
      t.integer :hp

      t.timestamps
    end
  end
end
