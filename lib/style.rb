class Style < ActiveRecord::Base
  belongs_to :category
  has_many :beers 
  has_many :breweries, through: :beers
  has_many :favorites, through: :beers
  has_many :users, through: :beers 
end