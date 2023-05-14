class Topic < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :topic_image
end
