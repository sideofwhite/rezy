class CreateFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :features do |t|
      t.integer :bed
      t.integer :bath
      t.integer :rent
      t.text :available
      t.boolean :dishwasher
      t.boolean :washer_dryer
      t.boolean :hardwood
      t.boolean :deck
      t.boolean :air
      t.boolean :cat
      t.boolean :dog
      t.boolean :bbq
      t.text :title
      t.text :description
      t.boolean :new_kitchen
      t.string :neighbourhood
      t.references :rental, foreign_key: true
      t.boolean :year_lease

      t.timestamps
    end
  end
end
