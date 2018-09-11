class Brewery < ActiveRecord::Base
  has_many :beers 
  has_many :categories, through: :beers
  has_many :styles, through: :beers
  has_many :users, through: :beers 
  has_many :favorites, through: :beers 
end