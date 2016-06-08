class AddApprovedToRentals < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :approved, :boolean, :default => false
  end
end
