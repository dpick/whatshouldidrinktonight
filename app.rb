require 'rubygems'
require 'sinatra'
require 'config'

configure do
  unit = Unit.first_or_create(:name => 'oz')
  ingre = Ingredient.first_or_create(:name => 'gin', :amount => 1, :unit => unit)

  drink = Drink.first_or_create(:name => 'gin and tonic')
  drink.ingredients << ingre
  drink.save
  
  Beer.first_or_create(:name => 'fat tire')
end

get '/' do
  all = Drink.all
  all[rand(all.size)].name
end

get '/beer' do
  all = Beer.all
  all[rand(all.size)].name
end
