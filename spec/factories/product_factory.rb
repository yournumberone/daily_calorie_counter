# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    protein_g { Faker::Number.decimal(l_digits: 2, r_digits: 1) }
    fat_total_g { Faker::Number.decimal(l_digits: 2, r_digits: 1) }
    carbohydrates_total_g { Faker::Number.decimal(l_digits: 2, r_digits: 1) }
    calories { Faker::Number.decimal(l_digits: 3, r_digits: 1) }
    association :creator
  end
end
