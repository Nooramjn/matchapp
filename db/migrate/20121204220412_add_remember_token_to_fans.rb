class AddRememberTokenToFans < ActiveRecord::Migration
  def change
  	add_column :fans, :remember_token, :string
    add_index  :fans, :remember_token
  end
end
