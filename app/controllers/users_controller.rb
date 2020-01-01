class UsersController < ApplicationController

    # users can sign up
    get '/signup' do
        erb :'/users/signup'    #  /users/signup?  or without the slash before user?
      end
  
      post '/signup' do
          # users should not be able to create an account with any blank credentials
          # users should not be able to create an account with a username that already exists
  
          user = User.new(params)  #instantiates a new user
          if user.username.empty? || user.password.empty?
              @error = "Please enter a valid username and password."
              erb :'/users/signup'        #  here too
          else
              user.save
              session[:user_id] = user.id   #this line is logging them in
              redirect '/podcasts'
          end
      end
  
  
      # users can delete account
  
  end