class AddDateToMeals < ActiveRecord::Migration[7.0]
  def change
    add_column :meals, :date, :date
  end
end
