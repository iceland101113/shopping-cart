class Cart < ApplicationRecord
  has_many :cartitems, dependent: :destroy 

  def add_cart_item(product)
    existing_item = self.cartitems.find_by( product_id: product )
    if existing_item
      existing_item.quantity += 1
      existing_item.save!
    else
      cart_item = cartitems.build( product_id: product, quantity: 1 )
      cart_item.save!
    end
    self.cartitems
  end

  def total_price
    self.cartitems.reduce(0) { |sum, item| sum + item.total_money }
  end

end
