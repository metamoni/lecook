# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe 'GET #index' do
    before do
      get :index
    end

    it 'responds with http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns empty array if no ingredients saved' do
      expect(assigns(:ingredients)).to eq []
    end

    it 'assigns all ingredients' do
      %w[Sugar salt pepper oraNGEs ChickPeaS].map do |name|
        FactoryBot.create(:ingredient, name: name)
      end

      expect(assigns[:ingredients].count).to eq 5
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { { name: 'Maple syrup' } }

      before(:each) do
        post :create, params: { ingredient: valid_params }
      end

      it 'redirects to ingredients page' do
        expect(controller).to redirect_to(ingredients_url)
      end

      it 'sends flash message' do
        expect(flash[:notice]).to eq('Ingredient added')
      end

      it 'adds new ingredient to database' do
        expect(Ingredient.count).to eq 1
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { name: 'Courgette', bad_param: 'I will break your app' } }

      before do
        post :create, params: { ingredient: invalid_params }
      end

      it 'saves ingredient without bad params' do
        expect { Ingredient.last.bad_param }.to raise_error(NoMethodError, /undefined method `bad_param'/)
      end
    end

    context 'with duplicate name' do
      let!(:courgette) { create(:ingredient, name: 'Courgette') }
      let(:ingredient_params) { { name: 'courgette' } }

      before do
        post :create, params: { ingredient: ingredient_params }
      end

      it 'redirects to ingredients path' do
        expect(controller).to redirect_to ingredients_url
      end

      it 'displays flash message' do
        expect(flash[:notice]).to eq 'Ingredient already exists'
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when ingredient found' do
      let(:ingredient) { create(:ingredient) }

      before(:each) do
        delete :destroy, params: { id: ingredient.id }
      end

      it 'redirects to ingredients path' do
        expect(controller).to redirect_to(ingredients_url)
      end

      it 'sends flash notice' do
        expect(flash[:notice]).to eq('Ingredient deleted')
      end
    end

    context 'when ingredient not found' do
      it 'raises error' do
        expect { delete :destroy, params: { id: 'invalid id' } }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
