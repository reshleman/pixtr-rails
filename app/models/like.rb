class Like < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  validates :user_id,
    uniqueness: {
      scope: [:likeable_type, :likeable_id],
      message: "can only like an item once"
    }
end
