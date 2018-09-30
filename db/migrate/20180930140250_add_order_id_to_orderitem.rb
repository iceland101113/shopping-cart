class AddOrderIdToOrderitem < ActiveRecord::Migration[5.1]
  def change
    add_column :orderitems, :product_id, :integer
    add_column :orderitems, :order_id, :integer
  end
end
