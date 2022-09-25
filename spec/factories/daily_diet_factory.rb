# frozen_string_literal: true

FactoryBot.define do
  factory :daily_diet do
    date { Date.today }
    planned_calories { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    user
  end
end
