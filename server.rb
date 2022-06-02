require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "app.sqlite3"}

class User < ActiveRecord::Base
end

get '/' do
  erb :index
end

post '/users' do
  @user = User.find_or_create_by(email: params[:email])

  erb :user
end

get '/users' do
  @users = User.all

  erb :users
end
