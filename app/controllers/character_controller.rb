class CharacterController < ApplicationController

  get '/characters' do
    erb :'/characters/index'
  end

  get '/characters/new' do
    erb :'/characters/new'
  end
end
