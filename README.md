# README


### 👾 Tech Stack

[![My Skills](https://skillicons.dev/icons?i=html,css,js,ruby,rails,postgres,tailwind)](https://skillicons.dev)

## Live Preview

- https://facebook-clone-jed3.onrender.com/

You can login with: 
Username - johnDoe@example.com 
Password - 123456

### 📺 Session Preview

![landing](https://user-images.githubusercontent.com/101200406/196034269-28fb3d7f-3194-4d2b-a327-39ce2453734b.png)

<br/>

![register](https://user-images.githubusercontent.com/101200406/196034570-4c25b282-5892-4538-bfbb-a6f1bd19e84a.png)

<br/>

https://user-images.githubusercontent.com/101200406/196034414-c6a27a28-5b08-4c16-83cf-82d9bf39bdcc.mp4

<br/><br/>

### 📋 Feature Roadmap

#### Registration

- Receive a welcome email on signup (SendGrid add-on) 
- Authentication via Devise _or_  :white_check_mark:
- Signup/login with GitHub using OAuth2 


#### Friendships

- Add other users as friends.  :white_check_mark:
- "Unfriend" other users.  :white_check_mark:
- Search for other users by name.  :white_check_mark:
- Accept or decline friendships from Notifications page.  :white_check_mark:

#### Posts

- Post text content, an image, or both.  :white_check_mark:
- Employ a modal pop up window for post creation ✅
- View your posts and friends' posts from the home page.  :white_check_mark:
- Edit/Delete your posts.  :white_check_mark:
- Comment on Posts.  :white_check_mark:
- "Like" Posts.  :white_check_mark:
- View which users "liked" a post.

#### Comments

- Comment on Posts.  :white_check_mark:
- Edit/Delete your comments.  :white_check_mark:
- Employ turbo frames for comment Edit/Delete actions :white_check_mark:
- Reply to Comments (Nested Comments).
- "Like" Comments.  :white_check_mark:
- Hide/show comments/replies.
- View which users "liked" a comment.  :white_check_mark:

#### Notifications

- Friend requests from other users  :white_check_mark:
- Employ turbo stream to update friend requests counter :white_check_mark:
- When a user accepts your friend requests
- When another user comments on or likes your post/comment
- Dismiss one or all notifications.

#### Profile

- Upload a profile picture.  :white_check_mark:
- Create a profile with basic attributes  :white_check_mark:
- Create a post from your profile page.
- View posts of friends from their profile page.  :white_check_mark:
- Send/accept a friend request from a user's profile page.  :white_check_mark:



# How to run this app locally?

- Clone the repository
 ```bash
  git clone https://github.com/Ivan-P23994/Facebook_Clone.git
```
- Navigate to the project directory

```bash
  cd SomnianT-Social-Platform
```
- Install dependencies

```bash
  bundle install
```

- Set up the database

```bash
  rails db:setup
```

- Start the server

```bash
  `./bin/dev`
```

- Visit https://localhost:3000 to view the app in the browser

You can login with
Username - johnDoe@example.com
Password - 123456

### ⭐ Reflection

This was a rewarding project. The initial challenge was modeling friendships, which I based around the idea of a friendship sender and receiver. Once a friendship is requested, the `Friendship` object is created. To confirm the state of the friendship relation between two users I used some rails magic along with SQL statements to check are there two reversed friendship objects aimed at each of the users. Depending on the result we can observe the state of the friendship between two users. In hindsight I am aware there were potentialy better ways to go about it(eg. using a default model enum state) but I achieved satisfactory results with this setup therefor I decided to keep it as is.


Another challenge was figuring out how to harness the power of Hotwire to make the app seem alive using turbo_frame_tag, turbo streams and stimulus controllers for events watching. Nesting frames into each other and watching which "link_to" & "button_to" need to trigger the frame and which has to exit it with "top". 



