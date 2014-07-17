class MakeLikesPolymorphic < ActiveRecord::Migration

  class Like < ActiveRecord::Base
  end

  def change
    add_column :likes, :content_type, :string
    rename_column :likes, :image_id, :content_id

    Like.all.each do |like|
      like.update!(content_type: "Image")
    end
  end
end
