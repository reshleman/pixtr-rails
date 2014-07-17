class RenameLikeContentToLikeble < ActiveRecord::Migration
  def change
    rename_column :likes, :content_type, :likeable_type
    rename_column :likes, :content_id, :likeable_id
  end
end
