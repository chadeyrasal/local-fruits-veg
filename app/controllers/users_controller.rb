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
    end
  end

  post "/signup" do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect "/signup"
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect "/users"
    end
  end

end
