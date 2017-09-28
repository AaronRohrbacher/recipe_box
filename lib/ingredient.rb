class Ingredient < ActiveRecord::Base
  has_many :books
  has_many :recipes, through: :books
  validates(:ingredients, uniqueness: {case_sensitve: false})
end
