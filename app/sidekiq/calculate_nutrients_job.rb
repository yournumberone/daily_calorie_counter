class CalculateNutrientsJob
  include Sidekiq::Job

  def perform(*args)
    meal = Meal.find_by(id: args.first)
    items = CalorieNinjasApi.take_items(meal.meal)
    meal.update(meal_attributes(items))
    add_meal_nutrients_to_diet(meal, meal.daily_diet)
  end

  private

  def meal_attributes(items)
    { protein_g: items.pluck('protein_g').map(&:to_f).reduce(:+),
      fat_total_g: items.pluck('fat_total_g').map(&:to_f).reduce(:+),
      carbohydrates_total_g: items.pluck('carbohydrates_total_g').map(&:to_f).reduce(:+),
      calories: items.pluck('calories').map(&:to_f).reduce(:+) }
  end

  def add_meal_nutrients_to_diet(meal, diet)
    diet.total_proteins += meal.protein_g
    diet.total_fats += meal.fat_total_g
    diet.total_carbohydrates += meal.carbohydrates_total_g
    diet.total_calories += meal.calories
    diet.save
  end
end
