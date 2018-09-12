require 'pry'

class Beer < ActiveRecord::Base
  belongs_to :style
  belongs_to :brewery
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites

  def self.most_popular(num)
    fav_array = Favorite.all.map { |favorite| favorite.beer_id }
    
    fav_count = fav_array.each_with_object(Hash.new(0)) { |id, count| count[id] += 1}

    fav_count = fav_array.sort_by { 
      |k, v| }.reverse.to_h

    fav_count.keys.first(num).map { 
      |id| self.find(id) }
  end
end