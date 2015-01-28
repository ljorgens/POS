require "sinatra"
require "sinatra/reloader"
also_reload 'lib/**/*.rb'
require "sinatra/activerecord"
require "./lib/product"
require "./lib/purchase"
require "pg"

get("/") do
  @products = Product.all()
  erb(:index)
end

post("/products") do
  new_product = Product.create({:description => params.fetch("description"), :price => params.fetch("price").to_f() })
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

delete("/") do
  @product = Product.find(params.fetch("product_id").to_i())
  @product.delete()
  @products = Product.all()
  erb(:index)
end

patch("/cart") do
  product_ids = params.fetch("product_ids")
  total = 0
  product_ids.each() do |product_id|
    total = total + Product.find(product_id.to_i()).price.to_f()
    total.round(2)
  end
  @purchase = Purchase.create({:description => nil, :total_price => total})

  product_ids.each() do |product_id|
    @purchase.products << Product.find(product_id.to_i())
  end
  erb(:purchase)
end

get("/purchases") do
  @purchases = Purchase.all
  erb(:purchases)
end

get "/purchases/:id" do
  @purchase = Purchase.find(params.fetch("id").to_i)
  erb(:purchase)
end
