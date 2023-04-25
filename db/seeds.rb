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

CSV.foreach("db/seed_articles.csv", headers: true) do |row|
  article = Article.new
  article.title = row["title"]
  article.published = row["published"]
  article.link = row["link"]
  country = Country.find_by(name: row["country"])
  puts country.name
  puts country.id
  puts article.published
  article.country_id = country.id
  category = Category.find_by(name: row["category"])
  article.category_id = category.id
  article.save
end
# Seed your database here

puts "✅ Done seeding!"

# how do I drop table
