class AddRentalToIssues < ActiveRecord::Migration[5.0]
  def change
    add_reference :issues, :rental, foreign_key: true
  end
end
