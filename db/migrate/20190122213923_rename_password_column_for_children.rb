class RenamePasswordColumnForChildren < ActiveRecord::Migration[5.2]
  def change
    rename_column :children, :password, :password_digest
  end
end
