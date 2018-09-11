class Category < ActiveRecord::Base
  has_many :styles
  has_many :beers 
  has_many :breweries, through: :beers
  has_many :users, through: :beers
  has_many :favorites, through: :beers
end