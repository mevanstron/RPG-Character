class UserController < ApplicationController

  get '/signup' do
    if !Helpers.logged_in?(session)
      erb :'users/new'
    else
      redirect to '/characters'
    end
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
    if !Helpers.logged_in?(session)
      erb :'users/login'
    else
      redirect to '/characters'
    end
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
    if Helpers.logged_in?(session)
      session.clear
    end
      redirect "/"
  end
end
