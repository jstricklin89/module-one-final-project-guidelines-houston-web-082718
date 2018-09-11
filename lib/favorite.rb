class Favorite < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user
  has_one :brewery, through: :beer
  has_one :category, through: :beer
  has_one :style, through: :beer
end