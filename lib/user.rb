class User < ActiveRecord::Base
  has_many :favorites
  has_many :beers, through: :favorites 
  has_many :styles, through: :beers
  has_many :breweries, through: :beers
  has_many :categories, through: :beers

  def add_favorite(id)
    Favorite.create(user_id: self.id, beer_id: id)
  end

  def most_popular_breweries(num)
    id_count = get_id_count(self.breweries)
  
    id_count.keys.first(num).map do |id|
      Brewery.find(id)
    end
  end

  def most_popular_styles(num)
    id_count = get_id_count(self.styles)
  
    id_count.keys.first(num).map do |id|
      Style.find(id)
    end
  end

  def most_popular_categories(num)
    id_count = get_id_count(self.categories)
    
    id_count.keys.first(num).map do |id|
      Category.find(id)
    end
  end

  def average_abv
    sum = 0
    self.favorites.each do |fav|
      sum += Beer.find(fav.beer_id).abv
    end
    (sum / self.favorites.length).round(2)
  end

  private

  def get_id_count(collection)
    id_array = collection.map do |item|
      item.id
    end
    
    id_count = id_array.each_with_object(Hash.new(0)) do |id, count|
      count[id] += 1
    end
    
    id_count = id_count.sort_by do |k, v|
      v
    end.reverse.to_h
  end
end