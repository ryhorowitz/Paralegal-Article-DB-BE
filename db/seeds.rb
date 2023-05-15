require "csv"
require "date"

puts "🌱 Seeding spices..."

def convert_date(date)
  date_string = Date.strptime(date, "%m/%d/%Y")
  international_date = date_string.strftime("%Y-%m-%d")
end

CSV.foreach("db/seed_countries.csv", headers: true) do |row|
  country = Country.new
  country.name = row["name"]
  country.save
end

CSV.foreach("db/seed_articles.csv", headers: true) do |row|
  country = Country.find_by(name: row["country"])
  category = Category.find_by(name: row["category"])
  published = convert_date row["published"]

  article = Article.new
  article.title = row["title"]
  article.published = published
  article.link = row["link"]
  article.country_id = country.id
  article.category_id = category.id
  article.save
end

puts "✅ Done seeding!"
