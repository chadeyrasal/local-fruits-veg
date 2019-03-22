class ProductsController < ApplicationController

  get "/products" do
    erb :"products/index"
  end
end
