class CreateOrderitems < ActiveRecord::Migration[5.1]
  def change
    create_table :orderitems do |t|
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
