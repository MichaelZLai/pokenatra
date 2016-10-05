require "sinatra"
require "sinatra/reloader"
require "active_record"
# require 'pry'

require_relative "db/connection"
require_relative "models/pokemon"
require_relative "models/trainer"

# Pokemon Information ++++++++++++++++++++++++++
get "/" do
  @pokemon = Pokemon.all
  erb :"pokemon/index"
end

# create pokemon +++++++++++++++
get "/new" do
  erb :"pokemon/new"
end

post "/" do
  Pokemon.create(params[:pokemon])
  redirect "/"
end

# edit pokemon +++++++++++++++++
get "/:id/edit" do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/edit"
end

put "/:id" do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect "/"
end

# delete pokemon ++++++++++++++++

delete "/:id" do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect "/"
end



# Trainer information ++++++++++++++++++++++++++
get "/trainers" do
  @trainers = Trainer.all
  erb :"trainer/index"
end

get "/trainers/new" do
  erb :"trainer/new"
end

post "/trainers" do
  Trainer.create(params[:trainer])
  redirect "/trainers"
end

get "/trainers/:id/edit" do
  @trainer = Trainer.find(params[:id])
  erb :"trainer/edit"
end

put "/trainers/:id" do
  @trainer = Trainer.find(params[:id])
  @trainer.update(params[:trainer])
  redirect "/trainers"
end

delete "/trainers/:id" do
  @trainer = Trainer.find(params[:id])
  @trainer.destroy
  redirect "/trainers"
end

get "/trainers/:id" do
  @trainer = Trainer.find(params[:id])
  @pokemons = @trainer.pokemons.map {|poke| poke.name}
  erb :"trainer/show"
end

# KEEP THIS AT THE BOTTOM SO IT ID EVERYTHING
get "/:id" do
  @pokemon = Pokemon.find(params[:id])
  @trainer = @pokemon.trainer.name
  erb :"pokemon/show"
end
#
# binding.pry
# puts "done"
