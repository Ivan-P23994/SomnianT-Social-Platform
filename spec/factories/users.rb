# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
FactoryBot.define do
  factory :user, aliases: [:author, :friend] do
    sequence(:password) { |n| "password#{n}" }
    sequence(:email) { |n| "user-#{n}@email.com" }
    sequence(:first_name) { |n| "user#{n}" }
    sequence(:last_name) { |n| "useric#{n}" }
  end
end
