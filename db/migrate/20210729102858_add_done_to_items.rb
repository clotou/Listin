class AddDoneToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :done, :boolean
  end
end
