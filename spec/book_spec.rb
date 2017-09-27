require('spec_helper')

# describe(Ingredient) do
#   describe('#ingredients') do
#     it('adds an ingredient to a recipe') do
#       cookie = Recipe.create(recipe: 'cookies')
#       ingredient1 = Ingredient.create(ingredient: 'flour')
#       ingredient2 = Ingredient.create(ingredient: 'sugar')
#       binding.pry
#       cookie.ingredients.push(ingredient1)
#       cookie.ingredients.push(ingredient2)
#       expect(cookie.ingredients).to eq([ingredient1, ingredient2])
#     end
#   end
# end
describe(Recipe) do
  it { should have_many(:ingredients) }
end
describe(Ingredient) do
  it { should have_many(:recipes) }
end
describe(Recipe) do
  it { should have_many(:tags) }
end
