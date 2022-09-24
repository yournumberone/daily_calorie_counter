class DietsChangeCaloriesToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :daily_diets, :total_calories, :decimal
  end
end
