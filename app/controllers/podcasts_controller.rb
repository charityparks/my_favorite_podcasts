class PodcastsController < ApplicationController



  get '/podcasts' do
      @podcasts = Podcast.all.reverse
      erb :'podcasts/index'
  end

  get '/podcasts/new' do
      
     erb :'/podcast/new' 
  end

  post '/podcasts' do
      podcast = Podcast.new(params)
      if !podcast.podcast_name.empty? && !podcast.episode_name.empty?
          podcast.save
          redirect to '/podcasts'
      else
          @error = "Data Invalid. Please Try Again."
          redirect to '/podcasts/new'
      end
  end

  get '/podcasts/:id' do
      @podcast = Podcast.find(params["id"])
      erb :'/podcasts/show'
  end

  get '/podcasts/:id/edit' do   
      @podcast = Podcast.find(params["id"])
      erb :'/podcasts/edit'
  end

  patch '/podcasts/:id' do
      @podcast = Podcast.find(params[:id])
      if !params["podcast"]["podcast_name"].empty? && !params["podcast"]["episode_name"].empty?
          @podcast.update(params["podcasts"])
          redirect "/podcasts/#{params[:id]}"

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