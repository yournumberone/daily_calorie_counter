# frozen_string_literal: true

class MealPolicy < ApplicationPolicy
  def destroy?
    user == record.daily_diet.user
  end
end
