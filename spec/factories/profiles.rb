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
FactoryBot.define do
  factory :profile do
    sequence(:birth_year) { |n| DateTime.now - 10 + n.year }
    birth_month { DateTime.now.month }
    birth_day { DateTime.now.day }
    gender { 'female' }
    occupation { 'plumber' }
    birth_place { 'planet-x' }
  end
end
