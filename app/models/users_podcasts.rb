class UsersPodcasts < ActiveRecord::Base
    belongs_to :podcasts 
    belongs_to :users 
    

end
