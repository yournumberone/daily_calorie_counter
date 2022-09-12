class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.decimal :calories, precision: 10, scale: 1
      t.decimal :proteins, precision: 10, scale: 1
      t.decimal :fats, precision: 10, scale: 1
      t.decimal :carbohydrates, precision: 10, scale: 1

      t.timestamps
    end
  end
end
