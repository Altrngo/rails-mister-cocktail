require 'json'
require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts "Cleaning database..."
# Ingredient.destroy_all

# puts "Creating ingredients..."
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

# puts "Finished!"

# *****************************************************************

puts "*****************************************************************"

puts "Cleaning database..."
Ingredient.destroy_all

puts "Parsing JSON..."

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

puts "Creating ingredients list..."

ingredient["drinks"].each do |element|
ingredient_name = Ingredient.new(name: element["strIngredient1"])

puts "Saving ingredients #{ingredient_name.name}..."
ingredient_name.save
end

puts "Finished!"

puts "*****************************************************************"

puts "Cleaning database..."
Cocktail.destroy_all

# puts "Creating Cocktails..."
# Cocktail.create(name: "Le Grand Schtroumpf")
# Cocktail.create(name: "Mojito")
# Cocktail.create(name: "Indien")

puts "Finished!"

puts "*****************************************************************"

# puts "Cleaning database..."
# Doses.destroy_all

# puts "Creating Dosess..."
# Doses.create(name: "Le Grand Schtroumpf")
# Doses.create(name: "Mojito")
# Doses.create(name: "Indien")

# puts "Finished!"

