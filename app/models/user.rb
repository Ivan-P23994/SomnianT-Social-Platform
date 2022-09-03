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

  has_many :requests_sent, class_name: 'Friendship', foreign_key: 'requestor_id',
                           inverse_of: 'requestor', dependent: :destroy

  has_many :requests_received, class_name: 'Friendship', foreign_key: 'receiver_id',
                               inverse_of: 'receiver', dependent: :destroy

  has_many :pending_requests, -> { merge(Friendships.not_friends) },
           through: :requests_sent, source: :receiver

  has_many :received_requests, -> { merge(Friendships.not_friends) },
           through: :requests_received, source: :requestor

  has_many :friends, lambda { |user|
                       unscope(where: :user_id)
                         .where("status = 'true'")
                         .where('friendships.requestor_id = :user_id OR
                       friendships.receiver_id = :user_id ', user_id: user.id)
                     }, class_name: 'Friendship'
end
