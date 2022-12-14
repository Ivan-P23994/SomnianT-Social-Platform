# == Schema Information
#
# Table name: profiles
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  birth_year  :string
#  birth_month :string
#  birth_day   :string
#  gender      :string
#  occupation  :string
#  birth_place :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Profile, type: :model do
  subject { build(:profile) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:gender) }
  it { is_expected.to validate_presence_of(:birth_month) }
  it { is_expected.to validate_presence_of(:birth_year) }
  it { is_expected.to validate_presence_of(:birth_day) }
  it { is_expected.to validate_presence_of(:image) }
end
