class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      t.string :species
      t.boolean :sickness
      t.integer :attack

      t.timestamps
    end
  end
end
