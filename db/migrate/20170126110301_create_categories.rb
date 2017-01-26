class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|

      t.string :cat_name
      t.decimal :cat_budget
      t.decimal :cat_average

      t.timestamps null: false
    end
  end
end
