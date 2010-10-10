require 'rubygems'
require 'sinatra'
require 'config'
require 'dm-core'
require 'dm-migrations'

before do
  unit = Unit.first_or_create(:name => 'Oz')
  ingre = Ingredient.first_or_create(:name => 'Gin', :amount => 1, :unit => unit)

  drink = Drink.first_or_create(:name => 'Gin And Tonic')
  drink.ingredients << ingre
  drink.save
  
  Beer.first_or_create(:name => 'Fat Tire')
end

get '/' do
  all = Drink.all
  @drink = all[rand(all.size)].name
  haml :index
end

get '/beer' do
  all = Beer.all
  "How about a <br><h1>#{all[rand(all.size)].name}</h1>"
end

get '/drink' do
  all = Drink.all
  "How about a <h1>#{all[rand(all.size)].name}</h1>"
end

post '/newdrink' do
  params.map { |key, val| params[key] = val.split(' ').map { |w| w.capitalize! }.join(' ') }
  unit = Unit.first_or_create(:name => params[:unit])
  ingredient = Ingredient.first_or_create(:name => params[:ingredient], :amount => params[:amount], :unit => unit)

  drink = Drink.first_or_create(:name => params[:drink])
  drink.ingredients << ingredient
  drink.save
  redirect '/drink'
end

post '/newbeer' do
  params.map { |key, val| params[key] = val.split(' ').map { |w| w.capitalize! }.join(' ') }
  Beer.first_or_create(:name => params[:beer])
  redirect '/beer'
end

get '/adddrink' do
  haml :adddrink
end

get '/addbeer' do
  haml :addbeer
end
