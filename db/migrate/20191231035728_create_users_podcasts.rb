class CreateUsersPodcasts < ActiveRecord::Migration
  def change
    create_table :Users_podcasts do |t|
      t.integer :user_id
      t.integer :figure_id
    end

    
  end
end
