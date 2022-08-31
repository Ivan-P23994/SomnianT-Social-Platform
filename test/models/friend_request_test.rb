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
require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
