class PostsController < ApplicationController

  get '/posts' do
    @posts = Post.all
    if !logged_in?
      redirect "/login"
    else
      erb :"posts/index"
    end
  end

  get '/posts/new' do
    if !logged_in?
      redirect "/login"
    else
      erb :"posts/new"
    end
  end

  post '/posts' do
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save

    if !logged_in?
      redirect "/login"
    else
      redirect "/posts/#{@post.id}"
    end
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    if !logged_in?
      redirect "/login"
    else
      erb :"posts/show"
    end
  end


  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save

    if !logged_in?
      redirect "/login"
    else
      redirect "/posts/#{@post.id}"
    end
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    @post.destroy

    if !logged_in?
      redirect "/login"
    else
      redirect "/posts"
    end
  end

  get '/posts/:id/edit' do
    if !logged_in?
      redirect "/login"
    else
      post = current_user.posts.find(params[:id])
        "An edit form #{current_user.id} is editing #{post.id}"
    end
  end


end
