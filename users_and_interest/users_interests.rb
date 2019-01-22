require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'
require 'pry'

before do
  @users = YAML.load_file('./users.yml')
end

helpers do
  def namify(sym)
    sym.to_s.capitalize
  end

  def list_interests(user)
    user[1][:interests].join(", ")
  end
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :users
end

get "/users/:user_name" do
  params[:user_name]
end