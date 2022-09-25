# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string
#  author_id  :bigint           not null
#  post_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  has_many :likes, as: :liked_on, dependent: :destroy

  validates :author, :post, :body,  presence: true
end
