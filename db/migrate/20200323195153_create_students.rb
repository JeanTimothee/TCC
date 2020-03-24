class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_phone
      t.string :fixed_phone
      t.string :email
      t.integer :nb_classes, default: 1
      t.datetime :birth_date
      t.references :total_payment, null: false, foreign_key: true
      t.references :level, null: false, foreign_key: true
      t.references :referent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
