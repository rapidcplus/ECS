class RenameVideoUrlToItemUrlInItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :video_url, :item_url
  end
end
