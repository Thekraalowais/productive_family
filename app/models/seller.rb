class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :username, uniqueness: true
validates_presence_of     :username, :name, :delivery_cost,:description, :phone
validates :username, uniqueness: true
  has_many :products
  ratyrate_rateable "quality"
  # has_many :orders
    has_many :items, through: :products
    has_many :orders, through: :items
  mount_uploader :img, ImageUploader
end
