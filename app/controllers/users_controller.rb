class UsersController < ApplicationController

    get "/signup" do
      erb :'users/signup.html'
    end

    post "/signup" do
     if params[:user].values.any?{|attribute| attribute == ""}
       redirect "/signup"
     else
       @user = User.new(params[:user])
       @user.save
       session[:id] = @user.id
       erb :"sessions/login.html"
     end
   end
end
