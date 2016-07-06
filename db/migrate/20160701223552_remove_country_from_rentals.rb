class RemoveCountryFromRentals < ActiveRecord::Migration[5.0]
  def change
    remove_column :rentals, :country, :string
  end
end
