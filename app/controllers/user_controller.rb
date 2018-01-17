class UserController < ApplicationController

  get '/signup' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(params[:user])

    if user.save
      redirect to '/characters'
    else
      redirect to '/signup'
    end
  end

  get '/login' do
    "Login page coming soon!"
  end
end