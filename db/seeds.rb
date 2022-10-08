# frozen_string_literal: true

require 'faker'

def assign_avatar!(profile, name)
  filename = "#{name}.jpg"
  path = Rails.root.join("app/assets/images/Seed Avatars", filename)
  File.open(path) do |io|
    profile.image.attach(io: io, filename: filename)
  end
end

@profiles = []

ActiveRecord::Base.transaction do
  ActiveRecord::Base.connection.reset_pk_sequence!('users')

  (1..30).each do |id|
    User.create!(
      id: id,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: '123456',
      password_confirmation: '123456'
    )

    @profiles << Profile.create!(
      user_id: id,
      birth_year: DateTime.now.year - (20 + id),
      birth_month: DateTime.now.month,
      birth_day: DateTime.now.day,
      gender: Faker::Gender.binary_type,
      occupation: Faker::Job.title,
      birth_place: Faker::Address.city
    )
  end

end

# set seed avatars
@profiles.each_with_index do |profile, index|
  assign_avatar!(profile, index)
end
