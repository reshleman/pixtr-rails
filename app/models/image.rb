class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments

  has_many :likes, as: :content

  has_and_belongs_to_many :groups

  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true

  # Tagging
  acts_as_taggable
end
