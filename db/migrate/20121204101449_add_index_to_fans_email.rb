class AddIndexToFansEmail < ActiveRecord::Migration
  def change
  	add_index :fans, :email, unique: true
  end
end
