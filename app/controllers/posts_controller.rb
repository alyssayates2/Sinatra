class PostsController < ApplicationController

  get '/posts' do
    @posts = Post.all
    erb :"posts/index"
  end

  get '/posts/new' do
      erb :"posts/new"
  end

  post '/posts' do
    @post = Post.create(:title => params[:title], :content => params[:content], :user_id => params[:user_id])
    redirect to "/posts/#{@post.id}"
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    title = Post.find(params[:title])
    erb :"/posts/show"
  end

  get '/posts/:id/user' do
    @post = Post.find_by_id(params[:id])
    erb :"/posts/show"
  end


  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :"posts/edit"
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.user_id = params[:user_id]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect "/posts"
  end
end
