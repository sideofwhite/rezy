class AddDepositToFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :features, :deposit, :integer
  end
end
