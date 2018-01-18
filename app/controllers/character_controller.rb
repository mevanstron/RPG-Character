class CharacterController < ApplicationController

  get '/characters' do
    erb :'/characters/index'
  end

  get '/characters/new' do
    erb :'/characters/new'
  end

  post '/characters' do
    character = Character.new(params[:character])
    character.user_id = session[user_id]
    character.save
  end
end
