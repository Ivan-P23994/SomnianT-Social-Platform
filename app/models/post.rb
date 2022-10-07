# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  body       :string
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  before_destroy :destroy_likes

  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, as: :liked_on, dependent: :destroy

  validates :author, :title, :body, presence: true

  def liked?(id)
    return true if likes.where(user_id: id).count > 1
  end

  def destroy_likes
    likes.destroy_all
  end
end
