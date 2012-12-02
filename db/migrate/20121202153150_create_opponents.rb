class CreateOpponents < ActiveRecord::Migration
  def change
    create_table :opponents do |t|
      t.string :name
      t.string :skill_level
      t.integer :home_capacity
      t.boolean :domestic
      t.boolean :rival

      t.timestamps
    end
  end
end
