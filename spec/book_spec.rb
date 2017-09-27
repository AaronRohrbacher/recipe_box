require('spec_helper')

describe(Ingredient) do
  describe('#ingredients') do
    it('adds an ingredient to a recipe') do
      cookie = Recipe.create(recipe: 'cookies')
      ingredient1 = Ingredient.create(ingredient: 'flour')
      ingredient2 = Ingredient.create(ingredient: 'sugar')
      binding.pry
      cookie.ingredients.push(ingredient1)
      cookie.ingredients.push(ingredient2)
      expect(cookie.ingredients).to eq([ingredient1, ingredient2])
    end
  end

  describe('#tags') do
    it('adds a tag to a recipe') do
      cookie = Recipe.create(recipe: 'cookies')
      tag1 = Tag.create(tag: 'face')
      tag2 = Tag.create(tag: 'chocolate')
      binding.pry
      cookie.tags.push(tag1)
      cookie.tags.push(tag2)
      expect(cookie.tags).to eq([tag1, tag2])
    end
  end

end
describe(Recipe) do
  it { should have_many(:ingredients) }
end
describe(Ingredient) do
  it { should have_many(:recipes) }
end
describe(Recipe) do
  it { should have_many(:tags) }
end
