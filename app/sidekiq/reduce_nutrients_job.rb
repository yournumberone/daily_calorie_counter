# frozen_string_literal: true

class ReduceNutrientsJob
  include Sidekiq::Job

  def perform(*args)
    attributes = args.first
    reduce_meal_nutrients_to_diet(attributes)
  end

  private

  def reduce_meal_nutrients_to_diet(attributes)
    diet = DailyDiet.find_by(id: attributes['daily_diet_id'])
    diet.total_proteins -= attributes['protein_g'].to_f
    diet.total_fats -= attributes['fat_total_g'].to_f
    diet.total_carbohydrates -= attributes['carbohydrates_total_g'].to_f
    diet.total_calories -= attributes['calories'].to_f
    diet.save
  end
end
