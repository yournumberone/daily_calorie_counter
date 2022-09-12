# frozen_string_literal: true

class Meal < ApplicationRecord
  belongs_to :daily_diet, class_name: 'DailyDiet'
end
