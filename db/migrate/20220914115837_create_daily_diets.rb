class CreateDailyDiets < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_diets do |t|
      t.references :user
      t.integer :planned_calories
      t.integer :total_calories, default: 0
      t.decimal :total_proteins, precision: 10, scale: 1, default: 0
      t.decimal :total_fats, precision: 10, scale: 1, default: 0
      t.decimal :total_carbohydrates, precision: 10, scale: 1, default: 0
      t.date :date

      t.timestamps
    end
  end
end
