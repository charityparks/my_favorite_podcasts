class UsersController < ApplicationController

    # users can sign up
    get '/signup' do
        erb :'users/signup'    #  /users/signup?  or without the slash before user?
    end
  
        post '/signup' do
          # users should not be able to create an account with any blank credentials
          # users should not be able to create an account with a username that already exists
  
        user = User.new(params)  #instantiates a new user
            if user.username.empty? || user.password.empty?
                @error = "Please enter a valid username and password."
                erb :'users/signup'        #  here too
            elsif User.find_by(username: user.username)
                @error = "Account with that username already exists."
                erb :'users/signup'
            else
                user.save
                session[:user_id] = user.id   #this line is logging them in
                redirect '/podcasts'
            end
        end
  
  
      # users can delete account

    #users can log in
    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        if params["username"].empty? || params["password"].empty?
            @error = "Username and password can't be blank."
            erb :'users/login'
        else
            if user = User.find_by(username: params["username"], password: params["password"])
                session[:user_id] = user.id
                redirect to '/podcasts'
            else
                @error = "Account not found"
                erb :'users/login'
            end         
        end
    end

    #users can log out
    get '/logout' do
        session.clear
        redirect to '/podcasts/welcome'
    end


  end
