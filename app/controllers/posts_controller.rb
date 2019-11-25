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

 #  post "/signup" do
 #   if params[:user].values.any?{|attribute| attribute == ""}
 #     redirect "/signup"
 #   else
 #     @user = User.new(params[:user])
 #     @user.save
 #     session[:id] = @user.id
 #     erb :"sessions/login.html"
 #   end
 # end

  get '/posts/new' do
      erb :"posts/new"
  end

  post '/posts' do
    binding.pry
    @post = current_user.posts.build(:title => params[:title], :content => params[:content])
    if @post(:title => params[:title], :content => params[:content]).any?{|attribute| attribute == ""}
      redirect "/posts/new"
    else
      @post.save
      redirect to "/posts"
    end
  end


  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :'/posts/show'
  end


  get '/posts/:id/edit' do
    @user = current_user
    @post = Post.find_by_id(params[:id])
    erb :"posts/edit"
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  delete '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect "/posts"
  end
end
