class Gallery < ApplicationRecord

has_attached_file :image, :styles => { :original => '800x800>' }
validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
validates_attachment_size :image, less_than: 1.megabytes

belongs_to :rental



end


