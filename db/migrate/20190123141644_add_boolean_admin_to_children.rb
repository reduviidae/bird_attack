class AddBooleanAdminToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :admin, :boolean, default: false
  end
end
