class AddIndexToDailyDiets < ActiveRecord::Migration[7.0]
  def change
    add_index :daily_diets, [:user_id, :date], unique: true
  end
end
