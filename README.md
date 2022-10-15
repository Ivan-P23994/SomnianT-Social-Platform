# README


### Built With

[![My Skills](https://skillicons.dev/icons?i=html,css,js,ruby,rails,postgres,tailwind)](https://skillicons.dev)


https://user-images.githubusercontent.com/101200406/195985880-d1fca843-722c-42a4-b054-f6eaef044882.mp4




### Feature Roadmap

#### Registration

- Receive a welcome email on signup (SendGrid add-on) 
- Authentication via Devise _or_  ✔️
- Signup/login with GitHub using OAuth2 

![landing](https://user-images.githubusercontent.com/101200406/195984221-fa8656cd-432b-468a-9288-cebb1e728b7a.png)

#### Friendships

- Add other users as friends.  ✔️
- "Unfriend" other users.  ✔️
- Search for other users by name.  ✔️
- Accept or decline friendships from Notifications page.  ✔️

#### Posts

- Post text content, an image, or both.  ✔️
- View your posts and friends' posts from the home page.  ✔️
- Edit/Delete your posts.  ✔️
- Comment on Posts.  ✔️
- "Like" Posts.  ✔️
- View which users "liked" a post.

#### Comments

- Comment on Posts.  ✔️
- Edit/Delete your comments.  ✔️
- Reply to Comments (Nested Comments).
- "Like" Comments.  ✔️
- Hide/show comments/replies.
- View which users "liked" a comment.  ✔️

#### Notifications

- Friend requests from other users  ✔️
- When a user accepts your friend requests
- When another user comments on or likes your post/comment
- Dismiss one or all notifications.

#### Profile

- Upload a profile picture.  ✔️
- Create a profile with basic attributes  ✔️
- Create a post from your profile page.
- View posts of friends from their profile page.  ✔️
- Send/accept a friend request from a user's profile page.  ✔️

![register](https://user-images.githubusercontent.com/101200406/195984216-8d0ba5c0-01b8-409e-820e-267d69e48272.png)


### Reflection

This was a rewarding project. The initial challenge was modeling friendships, which I based around the idea of a friendship sender and receiver. Once a friendship is requested, the `Friendship` object is created with a default enumerated status of `pending` => `enum status: %i[pending accepted declined]`. When a user clicks "accept", the status is updated to 'accepted'.

Another challenge was figuring out nested comments. For this, I had to harness the power of Rails' partials, rendering the `post.comments` collection within the post partial and then recursively rendering the `comment.comments` collection within the comment partial itself. This also required setting up the `:commentable` polymorphic association on the `Comment` model. Similarly `Like` objects belong to the polymorphic association `:likeable`

One of the biggest challenges was figuring out how to send a user notifications after certain user events. I achieved this via a `NotificationsManager` module [app/lib/notifications_manager.rb](app/lib/notifications_manager.rb) and private methods within the Controllers for which a notification may be relevant. For example,


# How to run this app locally?

- Clone the repository
- Navigate to the project directory by running `cd odin-facebook`
- Run `bundle install`
- Run `rails db:migrate` to setup the database
- Run `rails db:seed` to seed the database
- Start the rails server by running `./bin/dev`
- Visit https://localhost:3000 to view the app in the browser


You can login with
Username - janeDoe@example.com
Password - 123456

