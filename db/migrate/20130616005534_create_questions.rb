class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user
      t.string     :text
      t.string     :status, :default => "active"
      
      t.timestamps
    end
  end
end
