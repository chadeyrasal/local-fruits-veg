class UsersController < ApplicationController

  get "/users" do
    if logged_in?
      erb :"users/index"
    else
      flash[:errors] = "Please signup or login to access this page"
      redirect "/"
    end
  end

  get "/users/:slug" do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      erb :"users/show"
    else
      flash[:errors] = "Please signup or login to access this page"
      redirect "/"
    end
  end

  get "/signup" do
    if !logged_in?
      erb :"users/signup"
    else
      flash[:errors] = "You already have an account"
      redirect "/products"
    end
  end

  post "/signup" do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:errors] = "Please fill out all fields to create an account"
      redirect "/signup"
    elsif User.find_by(:username => params[:username])
      flash[:errors] = "This username is already in use. Please login"
      redirect "/login"
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      flash[:message] = "Your account has been successfully created"
      redirect "/products"
    end
  end

  get "/login" do
    if !logged_in?
      erb :"users/login"
    else
      flash[:errors] = "You are already logged in"
      redirect "/products"
    end
  end

  post "/login" do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Login successful"
      redirect "/products"
    elsif user
      flash[:errors] = "Your password is incorrect. Please try again"
      redirect "/login"
    else
      flash[:errors] = "The username you enterred is not in the system. Please signup to access the application"
      redirect "/signup"
    end
  end

  get "/logout" do
    if logged_in?
      session.clear
      flash[:message] = "You have been logged out"
      redirect "/"
    else
      redirect "/"
    end
  end

end
