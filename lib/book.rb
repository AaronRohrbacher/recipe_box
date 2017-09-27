class Book < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe
  belongs_to :tag
end
