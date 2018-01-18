class CharacterController < ApplicationController

  get '/characters' do
    if !Helpers.logged_in?(session)
      redirect to '/'
    else
      @characters = Character.all
      @current_user = Helpers.current_user(session)
      erb :'/characters/index'
    end
  end

  get '/characters/new' do
    if !Helpers.logged_in?(session)
      redirect to '/'
    else
      @user = Helpers.current_user(session)
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
    if !Helpers.logged_in?(session)
      redirect to '/'
    else
      @character = Character.find(params[:id])
      @current_user = Helpers.current_user(session)
      erb :'/characters/show'
    end
  end

  get '/characters/:id/edit' do
    if !Helpers.logged_in?(session)
      redirect to '/'
    else
      if Helpers.current_user(session).id == Character.find(params[:id]).user_id
        @character = Character.find(params[:id])
        erb :'/characters/edit'
      else
        redirect to "/characters/#{params[:id]}"
      end
    end
  end

  patch '/characters/:id' do
    character = Character.find(params[:id])
    character.update(params[:character])
    if character.save
      redirect to "/characters/#{character.id}"
    else
      redirect to "/characters/#{character.id}/edit"
    end
  end

  delete '/characters/:id/delete' do
    if Helpers.current_user(session).id == Character.find(params[:id]).user_id
      character = Character.find(params[:id])
      character.delete
      redirect to '/characters'
    else
      redirect to "/characters/#{params[:id]}"
    end
  end
end
