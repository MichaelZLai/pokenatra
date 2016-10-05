require "sinatra"
require "sinatra/reloader"
require "active_record"


require_relative "db/connection"
require_relative "models/pokemon"

get "/" do
  @pokemon = Pokemon.all
  erb :"pokemon/index"
end
# create pokemon
get "/new" do
  erb :"pokemon/new"
end

post "/" do
  Pokemon.create(params[:pokemon])
  redirect "/"
end
# edit pokemon
get "/:id/edit" do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/edit"
end

put "/:id" do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/edit"
end

get "/:id" do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/show"
end
