class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.integer :user_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
