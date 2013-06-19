class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user
      t.references :company
      t.string     :text
      t.string     :status, :default => "active"
      
      t.timestamps
    end
  end
end
