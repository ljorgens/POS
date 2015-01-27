require "sinatra"
require "sinatra/reloader"
also_reload 'lib/**/*.rb'
require "sinatra/activerecord"
require "./lib/product"
require "pg"

get("/") do
  erb(:index)
end
