class AddSloganToHomeVideos < ActiveRecord::Migration[8.0]
  def change
    add_column :home_videos, :slogan, :string
  end
end
