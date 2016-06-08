class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstName, presence: true
  validates :lastName, presence: true

  has_attached_file :avatar, :styles => { :thumb => "60x60>", :original => '200x200>' }, :default_url => "https://d35wvr8lexh22u.cloudfront.net/assets/profile/renter_avatar_300-90f0406348f3209cab9836c26718cb5e.png"
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  has_many :rentals
  has_many :issues
  has_many :requests

end
