class PodcastsController < ApplicationController

    # before do
    #     require_login
    # end

    get '/podcasts' do
        require_login
        @podcasts = Podcast.all.reverse
        erb :'/podcasts/index'
    end

    get '/podcasts/new' do
        require_login
        erb :'/podcasts/new'    
    end

    post '/podcasts' do
        require_login
        podcast = current_user.podcasts.build(params)
        
        if !podcast.name.empty? && !podcast.episode_name.empty?
            podcast.save
            redirect '/podcasts'
        else
            @error = "Data Invalid. Please Try Again."
            redirect '/podcasts/new'
        end
    end

    get '/podcasts/:id' do
        require_login
        @podcast = Podcast.find(params[:id])
        if @podcast
            erb :'/podcasts/show'
        else
            redirect '/podcasts'
        end
    end

    get '/podcasts/:id/edit' do
        require_login
        @podcast = Podcast.find(params[:id])
        erb :'/podcasts/edit'
    end

    patch '/podcasts/:id' do
        require_login
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
        require_login
        podcast = Podcast.find(params[:id])
        podcast.destroy
        redirect '/podcasts'
    end
end