# frozen_string_literal: true

class DailyDietPolicy < ApplicationPolicy
  def destroy?
    user == record.user
  end

  def show?
    destroy?
  end

  def edit?
    destroy?
  end

  def update?
    destroy?
  end
end
