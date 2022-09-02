# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string           not null
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :requests_sent, class_name: 'FriendRequest', foreign_key: 'requestor_id',
                           inverse_of: 'requestor', dependent: :destroy

  has_many :requests_received, class_name: 'FriendRequest', foreign_key: 'receiver_id',
                               inverse_of: 'receiver', dependent: :destroy

  has_many :friends_a, -> { merge(FriendRequest.friends) },
           through: :requests_sent, source: :receiver

  has_many :friends_b, -> { merge(FriendRequest.friends) },
           through: :requests_received, source: :requestor

  has_many :pending_requests, -> { merge(FriendRequest.not_friends) },
           through: :requests_sent, source: :receiver

  has_many :received_requests, -> { merge(FriendRequest.not_friends) },
           through: :requests_received, source: :requestor

  def friends
    friends_a + friends_b
  end
end
