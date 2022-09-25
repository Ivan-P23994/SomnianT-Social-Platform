# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string
#  author_id  :bigint           not null
#  post_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :comment do
    author
    post
    body { Faker::Hipster.sentences.sample }
  end
end
