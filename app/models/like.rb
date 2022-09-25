class Like < ApplicationRecord
  belongs_to :user
  belongs_to :liked_on, polymorphic: true
end
