class User < ActiveRecord::Base
  has_many :galleries
  has_many :comments
  has_many :group_memberships
  has_many :groups, through: :group_memberships

  has_many :likes

  has_many :liked_images, through: :likes, source: :content, source_type: "Image"
  has_many :liked_galleries, through: :likes, source: :content, source_type: "Gallery"

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def member?(group)
    groups.include?(group)
  end

  def join(group)
    groups << group
  end

  def leave(group)
    groups.delete(group)
  end

  def likes?(object)
    likes.find_by(content: object)
  end

  def like(object)
    likes.create(content: object)
  end

  def unlike(object)
    like = likes.find_by(content: object)
    like.destroy()
  end
end
