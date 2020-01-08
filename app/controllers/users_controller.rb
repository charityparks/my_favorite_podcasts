class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'    
    end
  
    post '/signup' do

    user = User.new(params)  #instantiates a new user
        if user.save
            session[:user_id] = user.id
            redirect '/podcasts'
        else
            @error = "Invalid credentials"
            erb :'/users/signup'
        end
    end
  
    get '/login' do
        erb :'users/login'
    end

    post "/login" do    
        if params["username"].empty? || params["password"].empty?
            @error = "Username and password can't be blank."
            erb :'users/login'
            elsif
                user = User.find_by(username: params["username"], password: params["password"])
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
        redirect to '/podcasts'
end
