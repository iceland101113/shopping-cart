class Order < ApplicationRecord
  has_many :orderitems, dependent: :destroy 
  belongs_to :user

  include AASM

  aasm do
    state :pending, initial: true
    state :paid, :shipping, :delivered, :returned, :refunded
    
    event :pay do
      transitions from: :pending, to: :paid
    end

    event :ship do
      transitions from: :paid, to: :shipping
    end

    event :delivering do
      transitions from: :shipping, to: :delivered
    end

    event :return do
      transitions from: [:delivered, :shipping], to: :returned
    end

    event :refund do
      transitions from: [:paid, :returned], to: :refunded
    end
  end


  def total_price
    self.orderitems.reduce(0) { |sum, item| sum + item.price }
  end
end
