class AddPasswordDigestToFans < ActiveRecord::Migration
  def change
    add_column :fans, :password_digest, :string
  end
end
