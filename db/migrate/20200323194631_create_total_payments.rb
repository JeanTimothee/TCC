class CreateTotalPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :total_payments do |t|
      t.integer :due

      t.timestamps
    end
  end
end
