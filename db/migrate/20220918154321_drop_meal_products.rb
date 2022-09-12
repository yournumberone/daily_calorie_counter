class DropMealProducts < ActiveRecord::Migration[7.0]
  def change
    drop_table :meal_products
  end
end
