class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.date :date
      t.string :desc
      t.string :merch
      t.decimal :amount
      t.references :category, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
