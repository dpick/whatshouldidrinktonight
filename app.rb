require 'rubygems'
require 'sinatra'
require 'config'

configure do
  unit = Unit.first_or_create(:name => 'oz')
  ingre = Ingredient.first_or_create(:name => 'gin', :amount => 1)
  ingre.unit = unit

  drink = Drink.first_or_create(:name => 'gin and tonic')
  drink.ingredients << ingre
  drink.save
end

get '/' do
  toReturn = ""
  Drink.all.each do |drink|
    toReturn << drink.name + "\n"
  end

  toReturn
end
