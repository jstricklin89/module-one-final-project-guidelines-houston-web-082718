class Beer < ActiveRecord::Base
  belongs_to :style
  belongs_to :brewery
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites

  def self.most_popular(num)
    Favorite.all.map { |favorite| favorite.beer_id }
  end
end