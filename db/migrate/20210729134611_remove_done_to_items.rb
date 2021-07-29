class RemoveDoneToItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :done, :boolean, default: :false
  end
end
