class RemoveDEfaultValueToItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :done, :boolean
  end
end
