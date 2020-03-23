class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :preferences do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.references :preference_student, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
