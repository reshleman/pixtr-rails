class Gallery < ActiveRecord::Base
  has_many :images
  belongs_to :user

  has_many :likes, as: :likeable

  validates :name, presence: true
  validates :description, presence: true
end
