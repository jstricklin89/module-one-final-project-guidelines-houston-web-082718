class Style < ActiveRecord::Base
  belongs_to :category
  has_many :beers 
  has_many :breweries, through: :beers
  has_many :favorites, through: :beers
  has_many :users, through: :beers 

  def self.most_popular(num)
    id_count = get_id_count(Favorite.all)

    id_count.keys.first(num).map do |id|
      Style.find(id)
    end
  end
  
  def self.get_id_count(collection)
    id_array = collection.map do |fav|
      fav.beer_id
    end
    
    style_array = id_array.map do |id|
      Beer.find(id).style_id
    end

    id_count = style_array.each_with_object(Hash.new(0)) do |id, count|
      count[id] += 1
    end
    
    id_count = id_count.sort_by do |k, v|
      v
    end.reverse.to_h
  end
  private_class_method :get_id_count
end