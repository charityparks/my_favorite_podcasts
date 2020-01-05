class PodcastsController < ApplicationController

    get '/podcasts' do
        if logged_in? #User.find_by(id: session[:user_id])
            @podcasts = Podcast.all.reverse
            erb :'/podcasts/index'
        else
            redirect to '/login'
        end
    end

    get '/podcasts/new' do
        if logged_in?  #User.find_by(id: session[:user_id])
            erb :'/podcasts/new' 
        else
            redirect to '/login'
        end       
    end

    post '/podcasts' do
        podcast = current_user.podcasts.build(params)
        
        if !podcast.name.empty? && !podcast.episode_name.empty?
            podcast.save
            redirect to '/podcasts'
        else
            @error = "Data Invalid. Please Try Again."
            redirect to '/podcasts/new'
        end
    end

    get '/podcasts/:id' do
        if logged_in?
            @podcast = Podcast.find(params[:id])
            erb :'/podcasts/show'
        else
            redirect to '/login'
        end
    end

    get '/podcasts/:id/edit' do 
        if logged_in?  
            @podcast = Podcast.find(params[:id])
            erb :'/podcasts/edit'
        else
            redirect '/login'
        end
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