# Rake is a way to have ruby code written for us that
# we can access through the command line
# These commands come from activrerecord/sinatra/rake

ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :console do
  Pry.start
end
