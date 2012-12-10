class AddAdminToFans < ActiveRecord::Migration
  def change
    add_column :fans, :admin, :boolean, default: false
  end
end
