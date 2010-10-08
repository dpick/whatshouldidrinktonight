class Drink
  include DataMapper::Resource

  property :id, Serial
  property :name, Text

  has n, :ingredients
end

class Ingredient
  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :amount, Float

  has 1,  :unit
  belongs_to :drink
end

class Unit
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  belongs_to :ingredient
end
