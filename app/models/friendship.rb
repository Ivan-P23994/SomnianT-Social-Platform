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
  # validate :no_self_referential_friend_requests
  # validate :request_in_one_direction_only
  # validate :no_requests_to_current_friends, if: -> { requestor }

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, :friend_id, presence: true
  validate :user_is_not_equal_friend
  validates :user_id, presence: true, uniqueness: { scope: :friend_id }

  def mutual?
    friend.friends.include?(user)
  end

  private

  def user_is_not_equal_friend
    errors.add(:friend, "can't be the same as the user") if user == friend
  end

  def no_self_referential_friend_requests
    if requestor_id == receiver_id
      errors.add(:receiver_id, :blank, message: 'No self referential friend requests allowed.')
    end
  end

  def request_in_one_direction_only
    if Friendship.exists?(requestor_id: receiver_id, receiver_id: requestor_id)
      errors.add(:receiver_id, :blank, message: 'There is a pending request from this user.')
    end
  end

  def no_requests_to_current_friends
    if requestor.friends.any? { |friend| friend.id == receiver.id }
      errors.add(:receiver_id, :blank, message: 'User is already friends with this receiver.')
    end
  end
end
