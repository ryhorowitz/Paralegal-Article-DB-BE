require "csv"
puts "🌱 Seeding spices..."

CSV.foreach("db/seed_countries.csv", headers: true) do |row|
  country = Country.new
  country.name = row["name"]
  country.save
end

CSV.foreach("db/seed_categories.csv", headers: true) do |row|
  country = Country.new
  country.name = row["name"]
  country.save
end
# Seed your database here
# using ruby i can parse it as a csv
# loop through file and Model.Create a record for everyline
puts "✅ Done seeding!"

# how do I drop table
