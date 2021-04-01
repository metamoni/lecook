class CreateIngredientsRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients_recipes, id: false do |t|
      t.belongs_to :ingredient
      t.belongs_to :recipe
    end
  end
end
