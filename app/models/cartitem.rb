class Cartitem < ApplicationRecord
  belongs_to :cart, dependent: :destroy 
  belongs_to :product, dependent: :destroy 

  def total_m
    self.total_m = self.product.price*self.quantity
    self.save
  end
end
