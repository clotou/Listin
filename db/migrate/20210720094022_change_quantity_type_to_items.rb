class ChangeQuantityTypeToItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :quantity, :string
  end
end
