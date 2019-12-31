class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :name
      t.string :host
      t.integer :episode_number
      t.string :episode_name
      t.belongs_to :user
    end
  end
end
