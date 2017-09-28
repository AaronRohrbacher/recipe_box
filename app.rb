require('bundler/setup')
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @search = false
  @tags = Tag.all
  @recipes = Recipe.all
  arr = []
  @recipes_sorted = arr
  erb(:index)
end

post('/') do
  recipe = params['recipe']
  rating = params['rating']
  Recipe.create(recipe: recipe, rating: rating)
  @recipes = Recipe.all
  @tags = Tag.all
  erb(:index)
end

get('/recipe/:id') do
  @recipe = Recipe.find(params['id'])
  @tags = @recipe.tags
  @ingredients = @recipe.ingredients
  erb(:recipe)
end

post('/recipe/:id') do
  @recipe = Recipe.find(params['id'])
  new_tag = Tag.create(tag: params['tag'])
  @recipe.tags.push(new_tag)
  @tags = @recipe.tags
  @ingredients = @recipe.ingredients
  erb(:recipe)
end

get('/recipe/:id/tag') do
  @recipe = Recipe.find(params['id'])
  @tags = Tag.all
  erb(:tag_recipe)
end

post('/recipe/:id/tag') do
  @recipe = Recipe.find(params['id'])
  new_tag = Tag.find(params['tag_id'])
  @recipe.tags.push(new_tag)
  @tags = @recipe.tags
  erb(:tag_recipe)
end

get('/recipe/:id/ingredient') do
  @recipe = Recipe.find(params['id'])
  @ingredients = @recipe.ingredients
  erb(:ingredient)
end

post('/recipe/:id/ingredient') do
  ingredient = params['ingredient']
  @recipe = Recipe.find(params['id'])
  new_ingredient = Ingredient.create(ingredient: ingredient)
  @recipe.ingredients.push(new_ingredient)
  @ingredients = @recipe.ingredients
  erb(:ingredient)
end

get('/tag') do
  @tags = Tag.all
  erb(:tag)
end

post('/tag') do
  tag = params['tag']
  Tag.create(tag: tag)
  @tags = Tag.all
  erb(:tag)
end

get('/search_tag') do
  @recipes = []
  @tags = Tag.all
  erb(:search)
end

post('/search_tag') do
  arr = []
  query = Book.all.where(tag_id: params['search_tag'])
  query.each do |recipe|
    arr.push(Recipe.find(recipe.recipe_id))
  end
  @recipes_sorted = arr
  @tags = Tag.all
  @recipes = arr
  @search = true
  erb(:index)
end

post('/search_ingredient') do
  arr = []
  search_query = Ingredient.all.where(ingredient: params['search_ingredient'])

  arr2 = []
  search_query.each do |query|
    arr2.push(query.id)
  end

query = Book.all.where(ingredient_id: arr2)
binding.pry
# query = Book.all.where(ingredient_id: search_query.id)

  query.each do |recipe|
    arr.push(Recipe.find(recipe.recipe_id))
  end
  @recipes_sorted = arr
  @tags = Tag.all
  @recipes = arr
  @search = true
  erb(:index)
end
