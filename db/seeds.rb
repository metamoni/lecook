20.times do
  Recipe.create!([{
    title: Faker::Food.dish,
    instructions: Faker::Food.description
  }])
end
