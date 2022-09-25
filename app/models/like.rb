# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  user_id       :bigint           not null
#  liked_on_type :string
#  liked_on_id   :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :liked_on, polymorphic: true

  validates :user, presence: true
end
