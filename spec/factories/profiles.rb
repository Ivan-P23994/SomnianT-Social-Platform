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
