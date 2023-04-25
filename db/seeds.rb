require "csv"
puts "🌱 Seeding spices..."

CSV.foreach("db/seed_countries.csv", headers: true) do |row|
  country = Country.new
  country.name = row["name"]
  country.save
end

CSV.foreach("db/seed_categories.csv", headers: true) do |row|
  category = Category.new
  category.name = row["name"]
  category.save
end

# CSV.foreach("db/seed_categories.csv", headers: true) do |row|
#   article = Article.new
#   article.title = row["title"]
#   article.published = row["published"]
#   article.link = row["link"]
#   article.country_id = row["country_id"]
#   article.category_id = row["category_id"]
#   article.save
# end
# Seed your database here
# using ruby i can parse it as a csv
# loop through file and Model.Create a record for everyline
puts "✅ Done seeding!"

# how do I drop table
