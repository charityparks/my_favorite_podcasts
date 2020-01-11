require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
      enable :sessions
      set :session_secret, 'whatever'
      set :public_folder, 'public'
      set :views, 'app/views'
    end

    get "/" do
      erb :welcome
    end

    def logged_in?
        !!current_user
    # This is returning true or false. if the user is 
    # not found it will return false. use the double bang !! 
    end

    def current_user
      User.find_by(id: session[:user_id])  
    end

    def require_login
      unless logged_in?
        redirect '/login'
      end
    end
end
