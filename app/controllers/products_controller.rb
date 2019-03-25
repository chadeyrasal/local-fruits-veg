class ProductsController < ApplicationController

  get "/products" do
    if logged_in?
      erb :"products/index"
    else
      flash[:message] = "Please signup or login to access this page"
      redirect "/"
    end
  end

  get "/products/new" do
    if logged_in?
      erb :"products/new"
    else
      flash[:message] = "Please signup or login to access this page"
      redirect "/"
    end
  end

  get "/products/:id" do
    if logged_in?
      @product = Product.find_by(:id => params[:id])
      erb :"products/show"
    else
      flash[:message] = "Please signup or login to access this page"
      redirect "/"
    end
  end

  post "/products" do
    if params[:name] == "" || params[:quantity] == ""
      flash[:message] = "Please fill out the Name and Quantity fields to create a new product"
      redirect "/products/new"
    else
      @product = Product.new(:name => params[:name], :quantity => params[:quantity], :unit => params[:unit])
      @product.save
      flash[:message] = "This product has been successfully created"
      redirect "/products/#{@product.id}"
    end
  end

  get "/products/:id/edit" do
    if logged_in?
      @product = Product.find_by(:id => params[:id])
      if @product && @product.user == current_user
        erb :"products/edit"
      else
        flash[:message] = "You can only edit products that belong to you"
        redirect "/products/#{@product.id}"
      end
    else
      flash[:message] = "Please signup or login to access this page"
      redirect "/"
    end
  end

  patch "/products/:id" do
    if logged_in?
      if params[:name] == "" || params[:quantity] == ""
        flash[:message] = "Please fill out tye Name and Quantity fields to edit this product"
        redirect "/products/#{params[:id]}/edit"
      else
        @product = Product.find_by(:id => params[:id])
        if @product && @product.user == current_user
          @product.name = params[:name]
          @product.quantity = params[:quantity]
          @product.unit = params[:unit]
          @product.save
          flash[:message] = "This product has been successfully updated"
          redirect "/products/#{@product.id}"
        else
          flash[:message] = "You can only edit products that belong to you"
          redirect "/products"
        end
      end
    else
      flash[:message] = "Please signup or login to access this page"
      redirect "/"
    end
  end

  post "/products/:id" do
    if logged_in?
      @product = Product.find_by(:id => params[:id])
      if @product && @product.user == current_user
        @product.delete
      end
      flash[:message] = "You can only delete products that belong to you"
      redirect "/products"
    else
      flash[:message] = "Please signup or login to access this page"
      redirect "/"
    end
  end

end
