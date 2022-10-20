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
  after_commit :add_default_avatar, on: [:create]

  has_one_attached :image
  belongs_to :user

  validates :gender, :image, :birth_day, :birth_month, :birth_year, presence: true

  def birthday
    "#{birth_day} / #{Date::MONTHNAMES[birth_month.to_i]} / #{birth_year}"
  end

  def avatar
    if image.attached?
      image.variant(resize_to_limit: [250, 250]).processed
    else 
      image.attach(
        io: File.open(
        Rails.root.join('app', 'assets', 'images', 'cat.jpeg')),
        filename: 'cat.jpeg',
        content_type: 'image/jpeg'
        )
    end
  end

  protected

  def add_default_avatar
    unless image.attached?
      image.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'cat.jpeg'
          )
        ), filename: 'cat.jpeg',
        content_type: 'image/jpeg'
      )
    end
  end
end
