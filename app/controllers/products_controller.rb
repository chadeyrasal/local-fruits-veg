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

  get "/products/:id" do
    if logged_in?
      @product = Product.find_by(:id => params[:id])
      erb :"products/show"
    else
      redirect "/"
    end
  end

  post "/products" do
    if params[:name] == "" || params[:quantity] == ""
      redirect "/products/new"
    else
      @product = Product.new(:name => params[:name], :quantity => params[:quantity], :unit => params[:unit])
      @product.save
      redirect "/products/#{@product.id}"
    end
  end

  get "/products/:id/edit" do
    if logged_in?
      @product = Product.find_by(:id => params[:id])
      erb :"products/edit"
    else
      redirect "/"
    end
  end

  patch "/products/:id" do
    if logged_in?
      if params[:name] == "" || params[:quantity] == ""
        redirect "/products/#{params[:id]}/edit"
      else
        @product = Product.find_by(:id => params[:id])
        if @product && @product.user == current_user
          @product.name = params[:name]
          @product.quantity = params[:quantity]
          @product.unit = params[:unit]
          @product.save
          redirect "/products/#{@product.id}"
        else
          redirect "/products"
        end
      end
    else
      redirect "/"
    end
  end

  delete "/products/:id" do
    if logged_in?
      @product = Product.find_by(:id => params[:id])
      if @product && @product.user == current_user
        @product.destroy
        redirect "/products"
      else
        redirect "/products"
      end
    else
      redirect "/"
    end
  end

end
