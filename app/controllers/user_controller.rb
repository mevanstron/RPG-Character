class UserController < ApplicationController

  get '/signup' do
    erb :'users/new'
  end

  post '/signup' do
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
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect '/characters'
    else
      redirect '/login'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/logout' do
    session.clear
    redirect "/"
  end
end
