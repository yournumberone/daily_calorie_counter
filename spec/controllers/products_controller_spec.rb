# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:another_user) { FactoryBot.create(:user) }
  let!(:product) { FactoryBot.create(:product, creator: user) }

  describe 'GET products#index' do
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

  describe 'GET products#show' do
    it 'returns 200' do
      sign_in user
      get :show, params: { id: product.id }
      expect(response).to be_successful
    end
  end

  describe 'GET products#edit' do
    it 'returns 200' do
      sign_in user
      get :edit, params: { id: product.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'POST products#create' do
    it 'creates product' do
      sign_in user
      expect do
        post :create, params: { product: { name: 'Fish', calories: 129.2, protein_g: 26.0, fat_total_g: 2.7, carbohydrates_total_g: 0.0 } }
      end.to change(Product, :count).by(1)
    end

    it 'redirects unauthenticated user to sign_in' do
      expect do
        post :create, params: { product: { name: 'Fish', calories: 129.2, protein_g: 26.0, fat_total_g: 2.7, carbohydrates_total_g: 0.0 } }
      end.not_to change(Product, :count)
    end
  end

  describe 'GET products#edit' do
    it 'returns 200' do
      sign_in user
      get :edit, params: { id: product.id }
      expect(response).to be_successful
    end
  end

  describe 'PUT products#update' do
    it 'should update product' do
      sign_in user
      expect do
        put :update, params: { id: product.id, product: { protein_g: 4.4 } }
      end.to change { product.reload.protein_g }.from(product.protein_g).to(4.4)
    end
  end

  describe 'DELETE products#destroy' do
    it 'should destroy product' do
      sign_in user
      expect do
        delete :destroy, params: { id: product.id }
      end.to change(Product, :count).by(-1)
    end

    it 'should not destroy product if user is not authorized' do
      sign_in another_user
      expect do
        delete :destroy, params: { id: product.id }
      end.not_to change(Product, :count)
    end
  end
end
