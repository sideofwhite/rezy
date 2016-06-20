class AddLatitudeAndLongitudeToRental < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :latitude, :float
    add_column :rentals, :longitude, :float
  end
end
