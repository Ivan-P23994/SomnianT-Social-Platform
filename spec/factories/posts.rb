# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  body       :string
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :post do
    author
    title { [Faker::Company.name, Faker::Company.industry].join(' - ') }
    body { Faker::Quote.matz }
  end
end
