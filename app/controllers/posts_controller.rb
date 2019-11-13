class PostsController < ApplicationController

  get '/posts' do
    @posts = Post.all
    erb :"posts/index"
  end

  get '/posts/new' do
      erb :"posts/new"
  end

  post '/posts' do
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save

    redirect "/posts/#{@post.id}/show"

  end

  get '/posts/:id/show' do
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    erb :"posts/show"
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :"posts/edit"
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    @post.destroy
    redirect "/posts"
  end

  get '/posts/:id/user' do
    if logged_in?
      @post = Post.find(params[:id])
      if @post.user.id == current_user.id
        erb :'/posts/user'
      end
    end
  end

  get '/posts/:id' do
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    erb :"posts/show"
  end
end
