class RenameAasmInOrder < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :aasm, :aasm_state
  end
end
