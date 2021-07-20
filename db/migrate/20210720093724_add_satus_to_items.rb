class AddSatusToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :status, :boolean, default: :false
  end
end
