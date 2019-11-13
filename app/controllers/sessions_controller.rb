class SessionsController < ApplicationController

  get '/login' do
    erb :"sessions/login.html"
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect '/posts/new'
    else
      redirect "/"
    end
  end

  get '/logout' do
    logout!
    erb :index
  end
end
