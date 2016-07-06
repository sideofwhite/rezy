class AddStreetNumberToRentals < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :street_number, :integer
    add_column :rentals, :country, :string
  end
end
