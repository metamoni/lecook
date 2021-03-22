require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:recipe) { create(:recipe) }
  
  describe 'GET #index' do
    before do
      get :index
    end

    it 'responds with http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns empty array if no recipes saved' do
      expect(assigns(:recipes)).to eq []
    end

    it 'assigns all recipes' do
      FactoryBot.create_list(:recipe, 5)
      expect(assigns[:recipes].count).to eq 5
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { { title: 'Food', instructions: 'Do things' } }

      before(:each) do
        post :create, params: { recipe: valid_params }
      end

      it 'redirects to recipes page' do        
        expect(controller).to redirect_to(recipes_url)
      end

      it 'sends flash message' do
        expect(flash[:notice]).to eq('Recipe added')
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { title: 'Food', instructions: 'Do things', bad_param: 'I will break your app' } }

      before do
        post :create, params: { recipe: invalid_params }
      end

      it 'saves recipe without bad params' do
        expect { Recipe.last.bad_param }.to raise_error(NoMethodError, /undefined method `bad_param'/)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when recipe found' do
      before(:each) do
        delete :destroy, params: { id: recipe.id }
      end

      it 'redirects to recipes path' do
        expect(controller).to redirect_to(recipes_url)
      end

      it 'sends flash notice' do
        expect(flash[:notice]).to eq('Recipe deleted.')
      end
    end

    context 'when recipe not found' do
      it 'raises error' do
        expect { delete :destroy, params: { id: recipe.id - 1 } }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
