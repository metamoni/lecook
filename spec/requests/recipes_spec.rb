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
      context "when required params present" do
        before(:each) do
          post "/recipes", params: { recipe: { title: 'Food', instructions: 'Do things' } }
        end

        it "redirects to recipes page" do        
          expect(controller).to redirect_to(recipes_url)
        end

        it "sends flash notice" do
          expect(flash[:notice]).to eq('Recipe added')
        end
      end

      context "when missing required params" do
        it "responds with 422 when instructions missing" do
          post "/recipes", params: { recipe: { title: "Food" } }

          expect(response.status).to be 422
          expect(response.message).to eq "Unprocessable Entity"
        end

        it "responds with 422 when title missing" do
          post "/recipes", params: { recipe: { instructions: "Do things" } }
          
          expect(response.status).to be 422
          expect(response.message).to eq "Unprocessable Entity"
        end
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
      context "when delete is successful" do
        before(:each) do
          delete "/recipes/#{pizza.id}"
        end

        it "redirects to recipes when recipe successfully deleted" do
          expect(controller).to redirect_to(recipes_url)
        end

        it "sends flash notice if recipe successfully deleted" do
          expect(flash[:notice]).to eq('Recipe deleted.')
        end
      end

      context "when delete fails" do
        it "raises error if record not found" do
          expect { delete "/recipes/#{pizza.id * 999}" }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end
end
