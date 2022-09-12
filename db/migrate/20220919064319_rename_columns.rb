class RenameColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :calories_per_100_g, :calories
    rename_column :products, :carbohydrates_per_100_g, :carbohydrates_total_g
    rename_column :products, :proteins_per_100_g, :protein_g
    rename_column :products, :fats_per_100_g, :fat_total_g
    rename_column :meals, :fats, :fat_total_g
    rename_column :meals, :proteins, :protein_g
    rename_column :meals, :carbohydrates, :carbohydrates_total_g
    change_column :products, :description, :text
  end
end
