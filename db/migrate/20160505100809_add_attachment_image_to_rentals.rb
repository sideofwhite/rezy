class AddAttachmentImageToRentals < ActiveRecord::Migration
  def self.up
    change_table :rentals do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :rentals, :image
  end
end
