class CharacterController < ApplicationController

  get '/characters' do
    erb :'/characters/index'
  end
end
