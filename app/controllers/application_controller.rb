require './config/environment'
require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  enable :sessions
  use Rack::Flash

  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "s51919915n_19ecre20"
  end

  get "/" do
    if logged_in?
      redirect "/products"
    else
      erb :index
    end
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      if session[:user_id]
        @current_user ||= User.find_by(:id => session[:user_id])
      end
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "Please signup or login to access this page"
        redirect "/"
      end
    end

  end

end
