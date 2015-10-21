require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

enable :sessions

get '/' do
  erb :index
end

get '/signup' do
  erb :signup
end

post '/resister' do
  User.create({name: params[:name],email: params[:email],password: params[:password]})
  redirect '/'
end

get '/signin' do
  erb :signin
end

post '/signup' do
  @user = User.create(email:params[:email], password:params[:password],
                      password_confirmation:params[:password_confirmation])
  if @user != nil
    session[:user]=@user.id
  end
  redirect '/'
end

post '/signin' do
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    session[:user] = user.id
  end
  redirect '/'
end

get '/signout' do
  session[:user] = nil
  redirect '/'
end

post '/add_item' do
  @item = Item.create(name: params[:name], price: params[:price], category_id: params[:category], image_url: params[:image_url])
  redirect '/'
end

post '/add_to_cart' do
  @cart = Cart.create(name: params[:name], price: params[:price])
  redirect '/my_cart'
end

post '/delete/:id' do
  Cart.find(params[:id]).delete
  redirect '/my_cart'
end

get '/category/:id' do
  @categories    = Category.all
  @category      = Category.find(params[:id])
  @category_name = @category.name
  @items         = @category.items
  erb:category
end

get '/my_cart' do
  erb :my_cart
end
