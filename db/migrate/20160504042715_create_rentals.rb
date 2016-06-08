class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.string :address
      t.string :addressSecondary
      t.string :city
      t.string :postal
      t.string :province

      t.timestamps
    end
  end
end
