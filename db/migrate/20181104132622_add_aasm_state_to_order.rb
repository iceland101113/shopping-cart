class AddAasmStateToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :aasm, :string
  end
end
