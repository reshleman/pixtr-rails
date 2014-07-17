class User < ActiveRecord::Base
  has_many :galleries
  has_many :comments
  has_many :group_memberships
  has_many :groups, through: :group_memberships

  has_many :likes

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
    likes.find_by(likeable: object)
  end

  def like(object)
    likes.create(likeable: object)
  end

  def unlike(object)
    like = likes.find_by(likeable: object)
    like.destroy()
  end
end
