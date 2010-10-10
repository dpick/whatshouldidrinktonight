require 'rubygems'
require 'sinatra'
require 'haml'
require 'config'
require 'dm-core'
require 'dm-migrations'
require 'pp'

before do
  params.map { |key, val| params[key] = val.split(' ').map { |w| w.capitalize }.join(' ') }
end

get '/' do
  "<a href=/beer>beer</a> or <a href=/drink>cocktail</a>" 
end

get '/beer' do
  all = Beer.all
  @beer = all[rand(all.size)]
  haml :beer
end

get '/drink' do
  all = Drink.all
  @drink = all[rand(all.size)]
  haml :drink
end

post '/newdrink' do
  unit = Unit.first_or_create(:name => params[:unit])
  ingredient = Ingredient.first_or_create(:name => params[:ingredient], :amount => params[:amount].to_f, :unit => unit)

  drink = Drink.first_or_create(:name => params[:drink])
  drink.ingredients << ingredient
  drink.save
  redirect '/drink'
end

post '/newbeer' do
  Beer.first_or_create(:name => params[:beer])
  redirect '/beer'
end

get '/adddrink' do
  haml :adddrink
end

get '/addbeer' do
  haml :addbeer
end
