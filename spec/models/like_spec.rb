# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  user_id       :bigint           not null
#  liked_on_type :string
#  liked_on_id   :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { build(:like) }

  it { is_expected.to belong_to(:user) }
end
