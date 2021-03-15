require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  let(:recipe) { create(:recipe) }

  context "when recipe is found" do
    describe "GET #index" do
      it "returns http success" do
        get "/recipes"
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get "/recipes/#{recipe.id}"
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
      it "returns http success" do
        post "/recipes"
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get "/recipes/#{recipe.id}/edit"
        expect(response).to have_http_status(:success)
      end
    end

    describe "PUT #update" do
      it "returns http success" do
        put "/recipes/#{recipe.id}"
        expect(response).to have_http_status(:success)
      end
    end

    describe "DELETE #destroy" do
      it "returns http found" do
        delete "/recipes/#{recipe.id}"
        expect(response).to have_http_status(:found)
      end
    end
  end

  context "when recipe is not found" do
    describe "DELETE #destroy" do
      it "raises error if record not found" do
        expect { delete "/recipes/#{recipe.id - 1}" }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
