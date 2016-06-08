class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :salary
      t.string :occupation
      t.boolean :smoker
      t.boolean :petowner

      t.timestamps
    end
  end
end
