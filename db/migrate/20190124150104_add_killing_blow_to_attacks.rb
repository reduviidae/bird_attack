class AddKillingBlowToAttacks < ActiveRecord::Migration[5.2]
  def change
    add_column :attacks, :killing_blow, :boolean, default: false
  end
end
