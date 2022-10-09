# frozen_string_literal: true

require 'faker'

def assign_avatar!(profile, name)
  filename = "#{name}.jpg"
  path = Rails.root.join("app/assets/images/Seed Avatars", filename)
  File.open(path) do |io|
    profile.image.attach(io: io, filename: filename)
  end
end
@users = []
@profiles = []

ActiveRecord::Base.transaction do
  ActiveRecord::Base.connection.reset_pk_sequence!('users')

  (1..30).each do |id|
    @users << User.create!(
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

  posts = []
  180.times do |i|
    date = Faker::Date.between(from: 2.years.ago, to: Date.today)
    body = case i
           when 0..36 then Faker::GreekPhilosophers.quote
           when 37..72 then Faker::Quotes::Shakespeare.hamlet_quote
           when 73..108 then Faker::Quotes::Shakespeare.as_you_like_it_quote
           when 109..144 then Faker::Quotes::Shakespeare.king_richard_iii_quote
           else Faker::Quotes::Shakespeare.romeo_and_juliet_quote
           end

    posts << Post.create!(
      title: Faker::Book.title,
      body: body,
      author: @users[rand(@users.length)],
      created_at: date,
      updated_at: date
    )
  end

   # create comments
   comments = []
   posts.each do |post|
     rand(5).times do
       user = @users[rand(@users.length)]
       date = Faker::Date.between(from: post.created_at, to: Date.today)
       body = Faker::Quote.jack_handey
       comments << Comment.create!(post: post,
                                   author: user,
                                   body: body,
                                   created_at: date,
                                   updated_at: date)
     end
   end

end

# set seed avatars
@profiles.each_with_index do |profile, index|
  assign_avatar!(profile, index)
end
