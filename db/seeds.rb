# frozen_string_literal: true

require 'faker'

sql_query = "SELECT setval(pg_get_serial_sequence('users', 'id'), coalesce(max(id)+1, 1), false) FROM users"

(1..10).each do |id|
  User.create!(
# each user is assigned an id from 1-20
      id: id, 
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
# issue each user the same password
      password: "123456", 
      password_confirmation: "123456",
  )
end

ActiveRecord::Base.connection.execute(sql)