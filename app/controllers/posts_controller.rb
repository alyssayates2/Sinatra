require 'pry'
class PostsController < ApplicationController

  get '/posts' do
    @posts = Post.all
    erb :"posts/index"
  end

  get '/posts/new' do
      erb :"posts/new"
  end

  post '/posts' do
    binding.pry
    @post = Post.create(:title => params[:title], :content => params[:content], :user_id => params[:user_id])
    redirect to "/posts"
  end


  get '/posts/:id/user' do
    @user = User.find_by_id(params[:id])
    @posts = @user

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
