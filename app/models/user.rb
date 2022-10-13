# frozen_string_literal: true

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
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile, allow_destroy: true

  has_many :posts, dependent: :destroy, foreign_key: :author_id
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy, foreign_key: :author_id
  has_many :liked_posts, through: :likes, source: :liked_on, source_type: 'Post'
  has_many :liked_comments, through: :likes, source: :liked_on, source_type: 'Comment'

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :received_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :received_friends, through: :received_friendships, source: 'user'

  validates :first_name, presence: true, length: 2..20
  validates :last_name, presence: true, length: 2..20
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX, message: 'Email is invalid' }
  def full_name
    "#{first_name} #{last_name}"
  end

  def active_friends
    sql = "SELECT DISTINCT e.friend_id
    FROM friendships m, friendships e
    WHERE m.user_id = #{id} AND  NOT e.friend_id = #{id}"

    arr = ActiveRecord::Base.connection.execute(sql).to_a.map { |a| a['friend_id'] }
    User.where('id IN (?)', arr)
  end

  def not_responded_requests
    a = Friendship.where(friend_id: id).map(&:user_id)
    b = Friendship.where(user_id: id).map(&:friend_id)
    c = a - b
    Friendship.where('user_id IN (?)', c)
  end

  def pending_friends
    friends.reject { |friend| friend.friends.include?(self) }
  end

  def not_friends?
    sql = "SELECT DISTINCT e.friend_id
    FROM friendships m, friendships e
    WHERE m.user_id = #{id} AND  NOT e.friend_id = #{id}"

    arr = ActiveRecord::Base.connection.execute(sql).to_a.map { |a| a['friend_id'] }
    User.where.not(id: arr)
  end

  def befriend(recepient_id)
    Friendship.create(user_id: id, friend_id: recepient_id)
  end

  def liked?(post)
    liked_posts.include?(post)
  end

  def liked_comment?(comment)
    liked_comments.include?(comment)
  end

  def dashboard_posts
    arr = friends.ids
    Post.where('author_id IN (?)', arr << id).limit(15)
  end

  private

  def populate_mutual_friendships
    (1..10).each do |other_id|
      Friendship.create!(
        user_id: id,
        friend_id: other_id
      )
      Friendship.create!(
        user_id: other_id,
        friend_id: id
      )
    end
  end
end
