require 'csv'

CSV.foreach('./openbeerdb_csv/beers.csv', headers: true) do |row|
  Beer.create(name: row.field("name"), brewery_id: row.field("brewery_id"), category_id: row.field("cat_id"), style_id: row.field("style_id"), abv: row.field("abv"))
end

CSV.foreach('./openbeerdb_csv/breweries.csv', headers: true) do |row|
  Brewery.create(name: row.field("name"), city: row.field("city"), state: row.field("state"), country: row.field("country"))
end
 
CSV.foreach('./openbeerdb_csv/categories.csv', headers: true) do |row|
  Category.create(name: row.field("cat_name"))
end
 
CSV.foreach('./openbeerdb_csv/styles.csv', headers: true) do |row|
  Style.create(name: row.field("style_name"), category_id: row.field("cat_id"))
end
