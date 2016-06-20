class AddFootageToFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :features, :sq_feet, :integer
    add_column :features, :property_type, :string
    add_column :features, :furnished, :boolean
  end
end
