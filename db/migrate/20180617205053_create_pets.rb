class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :breed
      t.string :variety
      t.string :sex
      t.date :date_of_birth
      t.boolean :is_approx_dob
      t.date :date_of_death
      t.date :gotcha_day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
