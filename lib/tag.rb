class Tag < ActiveRecord::Base
  has_many :books
  has_many :recipes, through: :books
end
