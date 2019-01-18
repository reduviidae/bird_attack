class CreateAttacks < ActiveRecord::Migration[5.2]
  def change
    create_table :attacks do |t|
      t.date :date
      t.integer :child_id
      t.integer :bird_id

      t.timestamps
    end
  end
end
