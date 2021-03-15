require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  let(:pizza) { create(:recipe) }

  context "when recipe is found" do
    describe "GET #index" do
      it "returns http success" do
        get "/recipes"
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get "/recipes/#{pizza.id}"
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get "/recipes/new"
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST #create" do
      let(:new_recipe) { post "/recipes", params: { recipe: { title: 'Food', instructions: 'Do things' } } }

      it "redirects after recipe is saved" do
        post "/recipes", params: { recipe: { title: 'Food', instructions: 'Do things' } }
        
        expect(new_recipe).to redirect_to(recipes_url)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get "/recipes/#{pizza.id}/edit"
        expect(response).to have_http_status(:success)
      end
    end

    describe "PUT #update" do
      it "returns http success" do
        put "/recipes/#{pizza.id}"
        expect(response).to have_http_status(:success)
      end
    end

    describe "DELETE #destroy" do
      it "returns http found" do
        delete "/recipes/#{pizza.id}"
        expect(response).to have_http_status(:found)
      end
    end
  end

  context "when recipe is not found" do
    describe "DELETE #destroy" do
      it "raises error if record not found" do
        expect { delete "/recipes/#{pizza.id - 1}" }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
