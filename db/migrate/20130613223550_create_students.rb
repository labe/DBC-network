class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :cohort
      t.references :user

      t.timestamps
    end
    add_index :students, :cohort_id
    add_index :students, :user_id
  end
end
