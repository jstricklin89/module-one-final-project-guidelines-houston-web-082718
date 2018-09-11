class User < ActiveRecord::Base
  has_many :favorites
  has_many :beers, through: :favorites 
  has_many :styles, through: :beers
  has_many :breweries, through: :beers
  has_many :categories, through: :beers
end