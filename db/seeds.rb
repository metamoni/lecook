# frozen_string_literal: true

20.times do
  Recipe.create!([{
                   title: Faker::Food.dish,
                   instructions: Faker::Food.description
                 }])
end

MealPlan.create!([{
                   start_date: Date.new(2021, 3, 15),
                   end_date: Date.new(2021, 3, 27)
                 }])

MealPlan.create!([{
                   start_date: Date.new(2021, 4, 1),
                   end_date: Date.new(2021, 4, 8)
                 }])
