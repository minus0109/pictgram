class Comment < ApplicationRecord
  validates :body , presence: true

  has_many :users
  has_many :topics
end
