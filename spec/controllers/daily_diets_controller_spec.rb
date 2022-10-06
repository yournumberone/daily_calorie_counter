# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DailyDietsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:another_user) { FactoryBot.create(:user) }
  let!(:daily_diet) { FactoryBot.create(:daily_diet, user:) }

  describe 'GET daily_diets#index' do
    it 'returns 200' do
      sign_in user
      get :index
      expect(response).to be_successful
    end

    it 'redirects unauthenticated user to sign_in' do
      get :index
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'GET daily_diets#show' do
    it 'returns 200' do
      sign_in user
      get :show, params: { id: daily_diet.id }
      expect(response).to be_successful
    end
  end

  describe 'GET daily_diets#edit' do
    it 'returns 200' do
      sign_in user
      get :edit, params: { id: daily_diet.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'POST daily_diets#create' do
    it 'creates diet' do
      sign_in user
      expect do
        post :create, params: { daily_diet: { planned_calories: 1200, date: Time.zone.yesterday } }
      end.to change(DailyDiet, :count).by(1)
    end

    it 'redirects unauthenticated user to sign_in' do
      expect do
        post :create, params: { daily_diet: { planned_calories: 1200, date: Time.zone.today } }
      end.not_to change(Meal, :count)
    end
  end

  describe 'GET daily_diets#edit' do
    it 'returns 200' do
      sign_in user
      get :edit, params: { id: daily_diet.id }
      expect(response).to be_successful
    end
  end

  describe 'PUT daily_diets#update' do
    it 'should update diet' do
      sign_in user
      expect do
        put :update, params: { id: daily_diet.id, daily_diet: { planned_calories: 999 } }
      end.to change { daily_diet.reload.planned_calories }.from(daily_diet.planned_calories).to(999)
    end
  end

  describe 'DELETE daily_diets#destroy' do
    it 'should destroy diet' do
      sign_in user
      expect do
        delete :destroy, params: { id: daily_diet.id }
      end.to change { DailyDiet.count }.by(-1)
    end

    it 'should not destroy diet if user is not authorized' do
      sign_in another_user
      expect do
        delete :destroy, params: { id: daily_diet.id }
      end.not_to change { DailyDiet.count }
    end
  end
end
