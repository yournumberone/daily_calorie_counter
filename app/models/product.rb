# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', optional: true
  validates :name, :calories, :protein_g, :fat_total_g, :carbohydrates_total_g, presence: true
  validates :name, uniqueness: true
end
