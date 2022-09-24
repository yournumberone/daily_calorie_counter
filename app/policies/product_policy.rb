# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  def destroy?
    user == record.creator
  end

  def edit?
    destroy?
  end

  def update?
    destroy?
  end
end
