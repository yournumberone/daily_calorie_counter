# frozen_string_literal: true

FactoryBot.define do
  factory :meal do
    meal { Faker::Food.dish }
    protein_g { Faker::Number.decimal(l_digits: 2, r_digits: 1) }
    fat_total_g { Faker::Number.decimal(l_digits: 2, r_digits: 1) }
    carbohydrates_total_g { Faker::Number.decimal(l_digits: 2, r_digits: 1) }
    calories { Faker::Number.decimal(l_digits: 3, r_digits: 1) }
    association :daily_diet
  end
end
