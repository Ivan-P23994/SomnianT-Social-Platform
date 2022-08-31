# frozen_string_literal: true

# == Schema Information
#
# Table name: friend_requests
#
#  id           :bigint           not null, primary key
#  requestor_id :bigint           not null
#  receiver_id  :bigint           not null
#  status       :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class FriendRequest < ApplicationRecord
  belongs_to :requestor, class_name: 'User', foreign_key: 'requestor_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  scope :friends, -> { where('status =?', true) }
  scope :not_friends, -> { where('status =?', false) }
end
