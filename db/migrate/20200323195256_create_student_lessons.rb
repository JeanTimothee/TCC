class CreateStudentLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :student_lessons do |t|
      t.references :student, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
