class UsersController < ApplicationController

  get "/users" do
    erb :"users/index"
  end

  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    erb :"users/show"
  end

  get "/signup" do
    if !logged_in?
      erb :"users/signup"
    else
      redirect "/products"
    end
  end

  post "/signup" do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect "/signup"
    elsif User.find_by(:username => params[:username])
      redirect "/login"
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect "/products"
    end
  end

  get "/login" do
    if !logged_in?
      erb :"users/login"
    else
      redirect "/products"
    end
  end

  post "/login" do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/products"
    elsif user
      redirect "/login"
    else
      redirect "/signup"
    end
  end

  get "/logout" do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect "/"
    end
  end

end
