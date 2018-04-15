class Product < ApplicationRecord
  validates_presence_of :name

  has_many :cartitems, dependent: :destroy 

  
end
