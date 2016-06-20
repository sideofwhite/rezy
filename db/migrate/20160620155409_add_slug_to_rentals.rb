class AddSlugToRentals < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :slug, :string
    add_index :rentals, :slug, unique: true
  end
end
