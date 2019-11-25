require 'pry'
class PostsController < ApplicationController

  get '/posts' do
    if logged_in?
      @posts = Post.all
      erb :"posts/index"
    else
      redirect "/login"
    end
  end

  get '/user/posts' do
    @posts = current_user.posts
    erb :"posts/index"
  end

  get '/posts/new' do
      erb :"posts/new"
  end

  post '/posts' do
    @post = current_user.posts.build(:title => params[:title], :content => params[:content])
    @post.save
    redirect to "/posts"
  end


  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :'/posts/show'
  end


  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
      if @post.user != current_user
        redirect to "/"
      else
        erb :"posts/edit"
      end
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    if @post.user != current_user
      redirect to "/"
    else
      @post.title = params[:title]
      @post.content = params[:content]
      @post.save
      redirect to "/posts/#{@post.id}"
    end
  end

  delete '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    if @post.user != current_user
      redirect to "/"
    else
      @post.delete
      redirect "/posts"
    end
  end
end
