class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.references :employer
      t.references :student
      t.string :who_initiated
      t.string :approved

      t.timestamps
    end
    add_index :interests, :employer_id
    add_index :interests, :student_id
  end
end
