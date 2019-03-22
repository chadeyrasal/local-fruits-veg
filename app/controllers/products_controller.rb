class ProductsController < ApplicationController

  get "/products" do
    if logged_in?
      erb :"products/index"
    else
      redirect "/"
    end
  end

  get "/products/new" do
    if logged_in?
      erb :"products/new"
    else
      redirect "/"
    end
  end

end
