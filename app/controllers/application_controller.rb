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

  end

end
