class User < ActiveRecord::Base
  has_many :favorites
  has_many :beers, through: :favorites 
  has_many :styles, through: :beers
  has_many :breweries, through: :beers
  has_many :categories, through: :beers

  def add_favorite(id)
    Favorite.create(user_id: self.id, beer_id: id)
    binding.pry
  end

  def delete_favorite(id)
    fav = self.favorites.find_by(beer_id: id)
    fav.destroy
  end

  def favorite_beer_names
    self.beers.each do |beer|
      puts "#{beer.brewery.name} - #{beer.name}"
    end
  end

  def most_popular_breweries(num)
    id_count = get_id_count(self.breweries)
  
    id_count.keys.first(num).map do |id|
      puts "#{Brewery.find(id).name}: #{Brewery.find(id).city}, #{Brewery.find(id).state}, #{Brewery.find(id).country}"
    end
  end

  def most_popular_styles(num)
    id_count = get_id_count(self.styles)
  
    id_count.keys.first(num).map do |id|
      puts "#{Style.find(id).name}"
    end
  end

  def most_popular_categories(num)
    id_count = get_id_count(self.categories)
    
    id_count.keys.first(num).map do |id|
      puts "#{Category.find(id).name}"
    end
  end

  def average_abv
    sum = 0
    self.favorites.each do |fav|
      sum += Beer.find(fav.beer_id).abv
    end
    avg = (sum / self.favorites.length).round(2)
    puts "Your average ABV is #{avg}%."

    if avg <= 4
      puts "You might as well be drinking water!"
    elsif avg > 4 && avg <= 6
      puts "That's a pretty standard amount of alcohol!"
    elsif avg > 6 && avg <= 8
      puts "You like your beers a bit stronger!"
    elsif avg > 8 && avg <= 10
      puts "Wow. Those are some pretty stiff drinks."
    elsif avg > 10
      puts "You might consider getting some help. We think you could have a problem."
    end
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