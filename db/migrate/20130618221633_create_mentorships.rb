class CreateMentorships < ActiveRecord::Migration
  def change
    create_table :mentorships do |t|
      t.string :name

      t.timestamps
    end
  end
end
