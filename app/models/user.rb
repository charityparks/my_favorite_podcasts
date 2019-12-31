class User < ActiveRecord::Base
    has_many :podcasts
end