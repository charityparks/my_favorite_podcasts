class PodcastsController < ApplicationController

    get '/welcome' do
       erb :welcome
    end 

    get '/podcasts' do
        if User.find_by(session[:user_id])
            @podcasts = Podcast.all.reverse
            erb :'podcasts/index'
        else
            redirect to '/login'
        end
    end

    get '/podcasts/new' do
      
        erb :'/podcasts/new' 
    end

    post '/podcasts' do
        podcast = Podcast.new(params)
      
        if !podcast.name.empty? && !podcast.episode_name.empty?
            podcast.save
            redirect to '/podcasts'
        else
            @error = "Data Invalid. Please Try Again."
            redirect to '/podcasts/new'
        end
    end

    get '/podcasts/:id' do
        @podcast = Podcast.find(params[:id])
        erb :'/podcasts/show'
    end

    get '/podcasts/:id/edit' do   
        @podcast = Podcast.find(params[:id])
        erb :'/podcasts/edit'
    end

    patch '/podcasts/:id' do
        @podcast = Podcast.find(params[:id])
        if !params["podcast"]["name"].empty? && !params["podcast"]["episode_name"].empty?
            @podcast.update(params["podcast"])
            redirect to "/podcasts/#{params[:id]}"   

        else
            @error = "Data invalid. Please try again."
            erb :'/podcasts/edit'
        end
    end
      
    delete '/podcasts/:id' do
        podcast = Podcast.find(params[:id])
        podcast.destroy
        redirect '/podcasts'
    end
end