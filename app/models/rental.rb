class Rental < ApplicationRecord
extend FriendlyId
friendly_id :address, use: :slugged

has_attached_file :image, :styles => { :original => '800x800>' }, :default_url => "https://www.onradpad.com/assets/manage/property-placeholder.png"
validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
validates_attachment_size :image, less_than: 1.megabytes



def full_address
 "#{address} #{city} #{province}"
end


geocoded_by :full_address   # can also be an IP address
after_validation :geocode 


belongs_to :user
has_many :tenants
has_many :issues
has_many :requests
has_many :galleries
has_one :feature


end
