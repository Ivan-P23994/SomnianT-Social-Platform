# == Schema Information
#
# Table name: profiles
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  age         :integer          not null
#  gender      :string
#  occupation  :string
#  birth_place :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
