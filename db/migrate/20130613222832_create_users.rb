class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean    :activated
      t.string     :email
      t.string     :facebook_url
      t.string     :first_name
      t.string     :github_handle
      t.string     :graduation_date
      t.text       :intro
      t.datetime   :last_login
      t.string     :last_name
      t.string     :linkedin_url
      t.string     :location
      t.string     :password_digest
      t.string     :phone
      t.string     :status
      t.string     :tumblr_url
      t.string     :twitter_url
      t.string     :groupable_type
      t.integer    :groupable_id
      t.timestamps
    end
  end
end
