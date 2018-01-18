class CharacterController < ApplicationController

  get '/characters' do
    @characters = Character.all
    erb :'/characters/index'
  end

  get '/characters/new' do
    erb :'/characters/new'
  end

  post '/characters' do
    character = Character.new(params[:character])
    character.user_id = session[user_id]
    character.save

    redirect to "/characters/#{character.id}"
  end

  get '/characters/:id' do
    @character = Character.find(params[:id])

    erb :'/characters/show'
  end

  get '/characters/:id/edit' do
    @character = Character.find(params[:id])
    erb :'/characters/edit'
  end

  patch '/characters/:id' do
    character = Character.find(params[:id])
    character.update(params[:character])
    redirect to "/characters/#{character.id}"
  end

  delete '/characters/:id/delete' do
    character = Character.find(params[:id])
    character.delete
    redirect to '/characters'
  end
end
