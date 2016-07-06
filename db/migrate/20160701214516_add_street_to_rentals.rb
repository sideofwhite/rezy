class AddStreetToRentals < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :street, :string
  end
end
