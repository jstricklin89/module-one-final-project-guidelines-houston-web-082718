class Beer < ActiveRecord::Base
  belongs_to :style
  belongs_to :brewery
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites

  def self.most_popular_beer
    # use id, use max_by on array, use count(id)
  end

  def self.average_abv

  end
end