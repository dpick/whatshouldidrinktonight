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
  'pick beer or drink'
end

get '/beer' do
  all = Beer.all
  all[rand(all.size)].name
end

get '/drink' do
  all = Drink.all
  all[rand(all.size)].name
end

get '/adddrink/:drink/:ingredient/:amount/:unit' do
  unit = Unit.first_or_create(:name => params[:unit])
  ingredient = Ingredient.first_or_create(:name => params[:ingredient], :amount => params[:amount], :unit => unit)

  drink = Drink.first_or_create(:name => params[:drink])
  drink.ingredients << ingredient
  drink.save
end

get '/addbeer/:beer' do
  Beer.first_or_create(:name => params[:beer])
end
