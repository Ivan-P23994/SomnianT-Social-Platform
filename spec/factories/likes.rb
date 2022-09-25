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
FactoryBot.define do
  factory :like do
    user
    
  end
end
