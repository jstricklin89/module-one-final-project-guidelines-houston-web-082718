class Favorite < ActiveRecord::Base
  belongs_to :beers
  belongs_to :users
end