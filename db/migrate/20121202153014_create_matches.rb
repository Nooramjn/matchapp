class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :type
      t.boolean :home
      t.integer :opponent_id

      t.timestamps
    end
  end
end
