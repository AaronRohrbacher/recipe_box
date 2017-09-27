class Recipe < ActiveRecord::Base
  has_many :books
  has_many :ingredients, through: :books
  has_many :tags, through: :books
end
