class CreateCompanyContacts < ActiveRecord::Migration
  def change
    create_table :company_contacts do |t|
      t.integer :user_id
      t.integer :company_id
      t.boolean :approved
      t.datetime :email_sent_on
      t.timestamps
    end
    add_index :company_contacts, :user_id
    add_index :company_contacts, :company_id
  end
end
