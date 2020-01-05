class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'    
    end
  
    post '/signup' do
    user = User.new(params)  #instantiates a new user
        if user.username.empty? || user.password.empty?
            @error = "Please enter a valid username and password."
            erb :'users/signup'       
        elsif User.find_by(username: user.username)
            @error = "Account with that username already exists."
            erb :'users/signup'
        else
            user.save
            session[:user_id] = user.id   #this line is logging them in
            redirect '/podcasts'
        end
    end
  
    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        if params["username"].empty? || params["password"].empty?
            @error = "Username and password can't be blank."
            erb :'users/login'
        else
            #if logged_in? 
            if user = User.find_by(username: params["username"], password: params["password"])
                session[:user_id] = user.id
                redirect to '/podcasts'
            else
                @error = "Account not found"
                erb :'users/login'
            end         
        end
    end

    get '/logout' do
        session.clear
        redirect to '/podcasts/welcome'
    end
end
