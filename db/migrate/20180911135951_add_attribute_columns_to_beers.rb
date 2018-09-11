class AddAttributeColumnsToBeers < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :category_id, :integer
    add_column :beers, :style_id, :integer
    add_column :beers, :abv, :float
  end
end
