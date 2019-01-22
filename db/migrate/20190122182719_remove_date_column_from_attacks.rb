class RemoveDateColumnFromAttacks < ActiveRecord::Migration[5.2]
  def change
    remove_column :attacks, :date
  end
end
