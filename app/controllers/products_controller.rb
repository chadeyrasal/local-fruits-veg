class ProductsController < ApplicationController

  get "/products" do
    if logged_in?
      erb :"products/index"
    else
      flash[:errors] = "Please signup or login to access this page"
      redirect "/"
    end
  end

  get "/products/new" do
    if logged_in?
      erb :"products/new"
    else
      flash[:errors] = "Please signup or login to access this page"
      redirect "/"
    end
  end

  get "/products/:id" do
    if logged_in?
      @product = Product.find_by(:id => params[:id])
      erb :"products/show"
    else
      flash[:errors] = "Please signup or login to access this page"
      redirect "/"
    end
  end

  post "/products" do
    if params[:name] == "" || params[:quantity] == ""
      flash[:errors] = "Please fill out the Name and Quantity fields to create a new product"
      redirect "/products/new"
    else
      @product = Product.new(:name => params[:name], :quantity => params[:quantity], :unit => params[:unit], :user_id => current_user.id)
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
        flash[:errors] = "You can only edit products that belong to you"
        redirect "/products/#{@product.id}"
      end
    else
      flash[:errors] = "Please signup or login to access this page"
      redirect "/"
    end
  end

  patch "/products/:id" do
    if logged_in?
      if params[:name] == "" || params[:quantity] == ""
        flash[:errors] = "Please fill out tye Name and Quantity fields to edit this product"
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
          flash[:errors] = "You can only edit products that belong to you"
          redirect "/products"
        end
      end
    else
      flash[:errors] = "Please signup or login to access this page"
      redirect "/"
    end
  end

  post "/products/:id" do
    if logged_in?
      @product = Product.find_by(:id => params[:id])
      if @product && @product.user == current_user
        @product.delete
        flash[:message] = "This product has successfully been deleted"
      else
        flash[:errors] = "You can only delete products that belong to you"
      end
      redirect "/products"
    else
      flash[:errors] = "Please signup or login to access this page"
      redirect "/"
    end
  end

end
