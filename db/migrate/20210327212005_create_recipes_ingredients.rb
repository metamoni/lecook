class CreateRecipesIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes_ingredients, id: false do |t|
      t.belongs_to :recipes
      t.belongs_to :ingredients
    end
  end
end
