class Order < ApplicationRecord
  has_many :orderitems, dependent: :destroy 
  belongs_to :user

  def total_price
    self.orderitems.reduce(0) { |sum, item| sum + item.price }
  end
end
