class AddColorsToHomeVideos < ActiveRecord::Migration[8.0]
  def change
    add_column :home_videos, :text_color, :string
  end
end
