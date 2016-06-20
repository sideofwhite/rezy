class AddRentalToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_reference :galleries, :rental, foreign_key: true
  end
end
