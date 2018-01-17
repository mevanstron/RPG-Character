class UserController < ApplicationController

  get '/signup' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(params[:user])


  end

  get '/login' do
    "Login page coming soon!"
  end
end
