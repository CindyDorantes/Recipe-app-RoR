# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create(name: 'Cindy', email: 'cindy@gmail.com', password: '123abc')
food = Food.create(name: 'orange', price: 12, quantity: 5, measurement_unit: 'pieces', user_id: user.id)
recipe = Recipe.create(name: 'Cake', preparation_time: '2 hours', cooking_time: '30 minutes', description: 'deliciouos cake', user_id: user.id)
RecipeFood.create(recipe:, food:, quantity: 6)
