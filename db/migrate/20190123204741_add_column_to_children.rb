class AddColumnToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :attacks, :damage_done, :integer
  end
end
