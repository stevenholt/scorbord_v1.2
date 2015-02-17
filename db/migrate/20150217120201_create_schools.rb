class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.text :full_name
      t.text :short_name
      t.text :initials
      t.text :mascot
      t.text :street
      t.text :city
      t.text :region
      t.text :postal_code

      t.timestamps null: false
    end
  end
end
