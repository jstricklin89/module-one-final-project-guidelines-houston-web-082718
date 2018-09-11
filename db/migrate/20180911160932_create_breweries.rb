class CreateBreweries < ActiveRecord::Migration[5.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country
    end
  end
end
