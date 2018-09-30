class Product < ApplicationRecord
  validates_presence_of :name

  has_many :cartitems, dependent: :destroy 
  has_many :carts, through: :cartitems
  has_many :orderitems, dependent: :destroy 
  has_many :orders, through: :orderitems

  
end
