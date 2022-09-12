class CreateMealProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :meal_products do |t|
      t.references :meal, index: false
      t.references :product, index: false
      t.integer :amount_in_grams
      t.boolean :eaten

      t.timestamps
    end
  end
end
