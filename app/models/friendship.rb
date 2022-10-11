# frozen_string_literal: true

# == Schema Information
#
# Table name: friendships
#
#  id         :bigint           not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, :friend_id, presence: true
  validate :user_is_not_equal_friend
  #validate :friends_max?
  validates :user_id, presence: true, uniqueness: { scope: :friend_id }

  def mutual?
    friend.friends.include?(user)
  end

  private

  def user_is_not_equal_friend
    errors.add(:friend, 'No self referential friend requests allowed.') if user == friend
  end

  def friends_max?
    errors.add(:friend, 'You can only have 100 friends.') if user.friends.count >= 100
  end
end
