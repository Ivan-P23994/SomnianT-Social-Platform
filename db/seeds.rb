# frozen_string_literal: true

require 'faker'

def assign_avatar!(user, name)
  filename = "#{name}.jpg"
  path = Rails.root.join("app/assets/images/Seed Avatars", filename)
  File.open(path) do |io|
    user.avatar.attach(io: io, filename: filename)
  end
end

@users = []

ActiveRecord::Base.transaction do
  Friendship.destroy_all
  Like.destroy_all
  Comment.destroy_all
  Post.destroy_all
  Profile.destroy_all
  User.destroy_all

  ActiveRecord::Base.connection.reset_pk_sequence!('likes')
  ActiveRecord::Base.connection.reset_pk_sequence!('posts')
  ActiveRecord::Base.connection.reset_pk_sequence!('users')
  ActiveRecord::Base.connection.reset_pk_sequence!('friendships')
  ActiveRecord::Base.connection.reset_pk_sequence!('profile')
  ActiveRecord::Base.connection.reset_pk_sequence!('comments')

  @users << (1..30).each do |id|
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

  # set seed avatars
  @users.each_with_index do |user, index|
    assign_avatar!(user, index)
  end
end
