class Brewery < ActiveRecord::Base
  has_many :beers 
  has_many :categories, through: :beers
  has_many :styles, through: :beers
  has_many :users, through: :beers 
  has_many :favorites, through: :beers 

  def self.most_popular(num)
    id_count = get_id_count(Favorite.all)

    id_count.keys.first(num).map do |id|
      puts Brewery.find(id).name
    end
  end
  
  def self.get_id_count(collection)
    id_array = collection.map do |fav|
      fav.beer_id
    end
    
    brew_array = id_array.map do |id|
      Beer.find(id).brewery_id
    end

    id_count = brew_array.each_with_object(Hash.new(0)) do |id, count|
      count[id] += 1
    end
    
    id_count = id_count.sort_by do |k, v|
      v
    end.reverse.to_h
  end
  private_class_method :get_id_count
end