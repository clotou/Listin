class ChangeStatusToItem < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :status, :done
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
