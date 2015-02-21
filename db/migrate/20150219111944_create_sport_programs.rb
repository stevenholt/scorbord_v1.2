class CreateSportPrograms < ActiveRecord::Migration
  def change
    create_table :sport_programs do |t|
      t.references :school
      t.text :sport

      t.timestamps null: false
    end
  end
end
