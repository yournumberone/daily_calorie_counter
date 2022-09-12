class RenameMealsNameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :meals, :name, :meal
  end
end
