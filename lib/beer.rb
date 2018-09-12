require 'pry'
class Beer < ActiveRecord::Base
  belongs_to :style
  belongs_to :brewery
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites

  def self.most_popular(num)
    id_count = get_id_count(Favorite.all)

    id_count.keys.first(num).map do |id|
      Beer.find(id)
    end
  end
  
  def self.get_id_count(collection)
    id_array = collection.map do |item|
      item.beer_id
    end
    
    id_count = id_array.each_with_object(Hash.new(0)) do |id, count|
      count[id] += 1
    end
    
    id_count = id_count.sort_by do |k, v|
      v
    end.reverse.to_h
  end
  private_class_method :get_id_count
end


