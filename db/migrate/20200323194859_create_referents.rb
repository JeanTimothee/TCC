class CreateReferents < ActiveRecord::Migration[6.0]
  def change
    create_table :referents do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
