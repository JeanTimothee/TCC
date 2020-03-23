class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.datetime :birth_date
      t.references :total_payment, null: false, foreign_key: true
      t.references :level, null: false, foreign_key: true
      t.references :referent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
