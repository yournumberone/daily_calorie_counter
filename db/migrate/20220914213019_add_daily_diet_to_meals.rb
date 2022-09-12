class AddDailyDietToMeals < ActiveRecord::Migration[7.0]
  def change
    add_reference :meals, :daily_diet, null: false, foreign_key: true
  end
end
