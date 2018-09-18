require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "購物車基本功能" do

    it "可以計算整台購物車的總消費金額" do
      cart = Cart.new
      p1 = Product.create(name:"七龍珠", price: 80)      # 建立商品 1
      p2 = Product.create(name:"冒險野郎", price: 200)   # 建立商品 2

      3.times {
        cart.add_cart_item(p1.id)
        cart.add_cart_item(p2.id)
      }

      expect(cart.total_price).to be 840
    end

  end
end
