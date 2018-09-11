require 'csv'

CSV.foreach('./openbeerdb_csv/beers.csv', headers: true) do |row|
  Beer.create(name: row.field("name"), brewery_id: row.field("brewery_id"), category_id: row.field("cat_id"), style_id: row.field("style_id"), abv: row.field("abv"))
end
