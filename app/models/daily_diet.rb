# frozen_string_literal: true

class DailyDiet < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :meals, dependent: :destroy
  validates :date, uniqueness: { scope: :user_id }
end
