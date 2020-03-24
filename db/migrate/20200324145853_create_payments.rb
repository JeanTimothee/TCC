class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :type
      t.date :time
      t.string :period
      t.text :comment
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
