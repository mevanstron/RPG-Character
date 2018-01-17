class UserController < ApplicationController

  get '/signup' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(params[:user])

    if user.save
      session[:user_id] = user.id
      redirect to '/characters'
    else
      redirect to '/signup'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(username: params[:user][:username], password: params[:user][:password])

    if user
    end
  end
end
