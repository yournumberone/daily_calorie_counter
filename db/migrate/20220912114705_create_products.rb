class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, index: true
      t.string :description
      t.decimal :calories_per_100_g, precision: 5, scale: 1
      t.decimal :proteins_per_100_g, precision: 5, scale: 1
      t.decimal :fats_per_100_g, precision: 5, scale: 1
      t.decimal :carbohydrates_per_100_g, precision: 5, scale: 1

      t.timestamps
    end
  end
end
