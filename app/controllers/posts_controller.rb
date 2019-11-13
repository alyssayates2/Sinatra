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

    redirect "/posts/show"

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
    redirect "/posts"
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    @post.destroy
    redirect "/posts"
  end
end
