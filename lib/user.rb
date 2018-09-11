require 'pry'

class User < ActiveRecord::Base
  has_many :favorites
  has_many :beers, through: :favorites 
  has_many :styles, through: :beers
  has_many :breweries, through: :beers
  has_many :categories, through: :beers

  def most_popular_breweries(num)
    id_array = self.breweries.map do |brewery|
      brewery.id
    end
    
    id_count = id_array.each_with_object(Hash.new(0)) { |id, count| count[id] += 1}
    
    id_count = id_count.sort_by do |k, v|
      v
    end.reverse.to_h
  
    id_count.keys.first(num).map do |id|
      Brewery.find(id)
    end

  end

end