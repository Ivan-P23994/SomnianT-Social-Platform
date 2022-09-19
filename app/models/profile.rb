# == Schema Information
#
# Table name: profiles
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  birth_year  :string
#  birth_month :string
#  birth_day   :string
#  gender      :string
#  occupation  :string
#  birth_place :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Profile < ApplicationRecord
  belongs_to :user

  def birthday
    "#{birth_day} / #{Date::MONTHNAMES[birth_month.to_i]} / #{birth_year}"
  end
end
