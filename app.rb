require('bundler/setup')
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all
  erb(:index)
end

post('/') do
  recipe = params['recipe']
  Recipe.create(recipe: recipe)
  @recipes = Recipe.all
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
