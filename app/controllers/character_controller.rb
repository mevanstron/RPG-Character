class CharacterController < ApplicationController

  get '/characters' do
    if !logged_in?
      redirect to '/'
    else
      @characters = Character.all
      erb :'/characters/index'
    end
  end

  get '/characters/new' do
    if !logged_in?
      redirect to '/'
    else
      erb :'/characters/new'
    end
  end

  post '/characters' do
    character = Character.new(params[:character])
    character.user_id = session[:user_id]
    character.save
    if character.save
      redirect to "/characters/#{character.id}"
    else
      redirect to '/characters/new'
    end
  end

  get '/characters/:id' do
    if !logged_in?
      redirect to '/'
    else
      @character = Character.find(params[:id])
      @current_user = current_user
      erb :'/characters/show'
    end
  end

  get '/characters/:id/edit' do
    if !logged_in?
      redirect to '/'
    else
      if current_user.id == Character.find(params[:id]).user_id
        @character = Character.find(params[:id])
        erb :'/characters/edit'
      else
        redirect to "/characters/#{params[:id]}"
      end
    end
  end

  patch '/characters/:id' do
    if current_user.id == Character.find(params[:id]).user_id
      character = Character.find(params[:id])
      character.update(params[:character])
      if character.save
        redirect to "/characters/#{character.id}"
      else
        redirect to "/characters/#{character.id}/edit"
      end
    else
      redirect to "/characters/#{params[:id]}"
    end
  end

  delete '/characters/:id/delete' do
    if current_user.id == Character.find(params[:id]).user_id
      character = Character.find(params[:id])
      character.delete
      redirect to "/users/#{current_user.slug}"
    else
      redirect to "/characters/#{params[:id]}"
    end
  end
end
