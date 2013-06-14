class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :pitcher_id
      t.integer :catcher_id
      t.boolean :approved
      t.timestamps
    end
    add_index :interests, :pitcher_id
    add_index :interests, :catcher_id
  end
end
