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
    gender { Faker::Gender.binary_type }
    occupation { Faker::Job.title }
    birth_place { Faker::Address.city }
    after(:build) do |post|
      post.image.attach(
        io: File.open(
        Rails.root.join('app', 'assets', 'images', 'cat.jpeg')),
        filename: 'cat.jpeg',
        content_type: 'image/jpeg'
        )
    end
  end
end
