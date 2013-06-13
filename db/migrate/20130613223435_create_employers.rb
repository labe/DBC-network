class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.references :company
      t.references :user

      t.timestamps
    end
    add_index :employers, :company_id
    add_index :employers, :user_id
  end
end
