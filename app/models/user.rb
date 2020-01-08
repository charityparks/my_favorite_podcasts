class User < ActiveRecord::Base
    validates :username, :password, presence: true
    validates_uniqueness_of :username
    has_secure_password
    has_many :podcasts
end