# frozen_string_literal: true

# == Schema Information
#
# Table name: friendships
#
#  id           :bigint           not null, primary key
#  requestor_id :bigint           not null
#  receiver_id  :bigint           not null
#  status       :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Friendship < ApplicationRecord
  validate :no_self_referential_friend_requests
  validate :request_in_one_direction_only
  validate :no_requests_to_current_friends, if: -> { requestor }

  belongs_to :requestor, class_name: 'User', foreign_key: 'requestor_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  scope :friends, -> { where('status =?', true) }
  scope :not_friends, -> { where('status =?', false) }

  private

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
