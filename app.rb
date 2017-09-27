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
  @tag = @recipe.tags
  @ingredients = @recipe.ingredients
  erb(:recipe)
end

post('/recipe/:id') do
  @recipe = Recipe.find(params['id'])
  new_tag = Tag.create(tag: params['tag'])
  @recipe.tags.push(new_tag)
  @tag = @recipe.tags
  @ingredients = @recipe.ingredients
  erb(:recipe)
end
