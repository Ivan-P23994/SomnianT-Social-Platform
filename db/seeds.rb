# frozen_string_literal: true

require 'faker'

sql_query = "SELECT setval(pg_get_serial_sequence('users', 'id'), coalesce(max(id)+1, 1), false) FROM users"

(1..30).each do |id|
  User.create!(
    id: id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456',
    password_confirmation: '123456'
  )

  Profile.create!(
    user_id: id,
    birth_year: DateTime.now.year - (20 + id),
    birth_month: DateTime.now.month,
    birth_day: DateTime.now.day,
    gender: Faker::Gender.binary_type,
    occupation: Faker::Job.title,
    birth_place: Faker::Address.city
  )
end

ActiveRecord::Base.connection.execute(sql_query)
