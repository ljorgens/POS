require "sinatra"
require "sinatra/reloader"
also_reload 'lib/**/*.rb'
require "sinatra/activerecord"
require "./lib/product"
require "pg"

get("/") do
  @products = Product.all()
  erb(:index)
end

post("/products") do
  new_product = Product.create({:description => params.fetch("description"), :price => params.fetch("price").to_f(2) })
  @products = Product.all()
  erb(:index)
end

get("/products/:id/edit") do
  @product = Product.find(params.fetch("id").to_i())
  erb(:product_edit)
end

patch("/") do
  description = params.fetch("description")
  price = params.fetch("price")
  @product = Product.find(params.fetch("product_id").to_i())
  @product.update({:description => description, :price => price})
  @products = Product.all()
  erb(:index)
end
