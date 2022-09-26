# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DailyDiets::MealsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:another_user) { FactoryBot.create(:user) }
  let!(:daily_diet) { FactoryBot.create(:daily_diet, user:) }
  let!(:meal) { FactoryBot.create(:meal, daily_diet:) }

  describe 'POST meals#create' do
    it 'returns 200' do
      sign_in user
      expect do
        post :create, params: { meal: { meal: 'Icecream' }, daily_diet_id: daily_diet.id }
      end.to change(Meal, :count).by(+1)
    end

    it 'redirects unauthenticated user to sign_in' do
      expect do
        post :create, params: { meal: { meal: 'Icecream' }, daily_diet_id: daily_diet.id }
      end.not_to change(Meal, :count)
    end
  end

  describe 'DELETE meals#destroy' do
    it 'should destroy meal' do
      sign_in user
      expect do
        delete :destroy, params: { id: meal.id, daily_diet_id: daily_diet.id }
      end.to change(Meal, :count).by(-1)
    end

    it 'should not destroy meal if user is not authorized' do
      sign_in another_user
      expect do
        delete :destroy, params: { id: meal.id, daily_diet_id: daily_diet.id }
      end.not_to change(Meal, :count)
    end
  end
end
