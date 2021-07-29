class RemoveDoneToItem < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :done, :boolean
  end
end
