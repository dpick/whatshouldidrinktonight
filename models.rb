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

  belongs_to :unit
  belongs_to :drink
end

class Unit
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :ingredients
end

class Beer
  include DataMapper::Resource

  property :id, Serial
  property :name, Text
end
