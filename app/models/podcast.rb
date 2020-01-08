class Podcast < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :name, :episode_name
end