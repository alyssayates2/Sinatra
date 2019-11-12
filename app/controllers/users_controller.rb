class UsersController < ApplicationController

    get "/signup" do
      erb :'users/signup.html'
    end

    post "/signup" do
   if params[:user].values.any?{|attribute| attribute == ""}
     redirect "/signup"
   else
     user = User.new(params[:user])
     user.save
     session[:id] = user.id
     erb :'/posts/show'
   end
 end

 post '/users' do
   @user = User.new
   @user.email = params[:email]
   @user.password = params[:password]
   if @user.save
     redirect '/login'
   else
     erb :'users/signup.html'
   end
 end
end
