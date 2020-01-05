class User < ActiveRecord::Base
    has_many :podcasts
    has_secure_password
end