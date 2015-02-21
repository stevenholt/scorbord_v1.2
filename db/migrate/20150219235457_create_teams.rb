class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :sport_program
      t.string :level
      t.string :classification
      t.string :region

      t.timestamps null: false
    end
  end
end
