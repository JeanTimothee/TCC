class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.integer :court
      t.integer :capacity
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :mini_tennis, default: false
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
