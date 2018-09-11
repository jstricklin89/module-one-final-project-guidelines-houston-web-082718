class Beer < ActiveRecord::Base
  belongs_to :style
  belongs_to :brewery
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites
end