class SessionsController < ApplicationController

  get '/login' do
    erb :"sessions/login.html"
  end

  post '/login' do
    erb :'posts/show'
  end

  post '/sessions' do
    login(params[:email], params[:password])
    redirect '/posts'
  end

  get '/logout' do
    logout!
    erb :index
  end

end
