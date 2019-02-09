class Comment < ApplicationRecord
  validates :user_id, presence:true
  validates :topic_id, presence:true
  validates :comment_text, presence:true

  has_many :users
  has_many :topics
end
