class AddNameColumnToDoctorAndFood < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :name, :string
    add_column :foods, :name, :string
  end
end
