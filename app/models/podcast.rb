class Podcast < ActiveRecord::Base
    has_many :users_podcasts
    has_many :users, through: :users_podcasts
end




# class User < ActiveRecord::Base
#     has_many :user_items
#     has_many :items, through: :user_items
#   end
   
#   class Item < ActiveRecord::Base
#     has_many :user_items
#     has_many :users, through: :user_items
#   end
   
#   class UserItem < ActiveRecord::Base 
#     belongs_to :user
#     belongs_to :item
#   end