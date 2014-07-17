class Gallery < ActiveRecord::Base
  has_many :images
  belongs_to :user

  has_many :likes, as: :content

  validates :name, presence: true
  validates :description, presence: true
end
