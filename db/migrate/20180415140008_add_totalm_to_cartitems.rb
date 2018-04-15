class AddTotalmToCartitems < ActiveRecord::Migration[5.1]
  def change
    add_column :cartitems, :total_m, :integer
  end
end
