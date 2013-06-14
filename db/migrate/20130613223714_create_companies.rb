class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :website
      t.string :name
      t.string :logo
      t.string :location
      t.string :status
      t.string :initial_email_contact

      t.timestamps
    end
  end
end
