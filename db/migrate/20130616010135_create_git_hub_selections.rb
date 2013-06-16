class CreateGitHubSelections < ActiveRecord::Migration
  def change
    create_table :git_hub_selections do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
