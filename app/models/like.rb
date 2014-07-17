class Like < ActiveRecord::Base
  belongs_to :content, polymorphic: true
  belongs_to :user

  validates :user_id,
    uniqueness: {
      scope: [:content_type, :content_id],
      message: "can only like an item once"
    }
end
