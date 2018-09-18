class Cartitem < ApplicationRecord
  belongs_to :cart 
  belongs_to :product 

  def total_money
    self.total_m = self.product.price*self.quantity
    self.save
    self.total_m
  end
end
