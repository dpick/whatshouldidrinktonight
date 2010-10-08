require 'rubygems'
require 'sinatra'
require 'config'
require 'dm-core'
require 'dm-migrations'

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

post '/adddrink' do
  unit = Unit.first_or_create(:name => params[:unit])
  ingredient = Ingredient.first_or_create(:name => params[:ingredient], :amount => params[:amount], :unit => unit)

  drink = Drink.first_or_create(:name => params[:drink])
  drink.ingredients << ingredient
  drink.save
end

post '/addbeer' do
  Beer.first_or_create(:name => params[:beer])
end
