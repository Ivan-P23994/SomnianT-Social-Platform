# == Schema Information
#
# Table name: profiles
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  age         :integer          not null
#  gender      :string
#  occupation  :string
#  birth_place :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Profile < ApplicationRecord
  belongs_to :user

  validates :age, presence: true, numericality: { in: 1..120 }
  validates :gender, presence: true
  validates :occupation, presence: true
  validates :birth_place, presence: true
end
