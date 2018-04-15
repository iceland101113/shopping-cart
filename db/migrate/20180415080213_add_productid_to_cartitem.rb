class AddProductidToCartitem < ActiveRecord::Migration[5.1]
  def change
    add_column :cartitems, :product_id, :integer
  end
end
