# README

This project is a generic social platform built with Ruby on Rails in the back,
Tailwindcss for styling and Hotwire + Stimulus for some frontend magic. 

![landing](https://user-images.githubusercontent.com/101200406/195984221-fa8656cd-432b-468a-9288-cebb1e728b7a.png)

![register](https://user-images.githubusercontent.com/101200406/195984216-8d0ba5c0-01b8-409e-820e-267d69e48272.png)




https://user-images.githubusercontent.com/101200406/195985880-d1fca843-722c-42a4-b054-f6eaef044882.mp4




# Features

Users can

- Sign in/Sign
- Create posts(text or images)
- Like Posts
- Post Comments(text or image)
- Like comments
- Add/Remove friends
- Search for users, friends or posts

You can login with
Username - janeDoe@example.com
Password - 123456

# How to run this app locally?

- Clone the repository
- Navigate to the project directory by running `cd odin-facebook`
- Run `bundle install`
- Run `rails db:migrate` to setup the database
- Run `rails db:seed` to seed the database
- Start the rails server by running `./bin/dev`
- Visit https://localhost:3000 to view the app in the browser

# Tests

You can run tests by running `bundle exec rspec`
