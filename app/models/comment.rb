class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  has_many :likes, as: :liked_on, dependent: :destroy
end
