# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(name: 'Cindy', email: 'cindy@gmail.com', password: '123abc')
user2 = User.create(name: 'David', email: 'david@gmail.com', password: '123abc')
user3 = User.create(name: 'Jodie', email: 'jodie@gmail.com', password: '123abc')
user4 = User.create(name: 'Sofi', email: 'sofi@gmail.com', password: '123abc')

recipe1 = Recipe.create(name: 'Cake', preparation_time: '2 hours', cooking_time: '30 minutes',
                        description: 'deliciouos cake', user_id: user1.id, public: true)
recipe2 = Recipe.create(name: 'Simple Dish', preparation_time: '2 hours', cooking_time: '30 minutes',
                        description: 'A quick and delicious food', user_id: user2.id, public: true)
recipe3 = Recipe.create(name: 'Too Much', preparation_time: '2 hours', cooking_time: '30 minutes',
                        description: 'My grandmothers original recipe', user_id: user3.id, public: true)
recipe4 = Recipe.create(name: 'High Roller', preparation_time: '2 hours', cooking_time: '30 minutes',
                        description: 'A kind of food made by wrapping ingredients in another food', user_id: user4.id,
                        public: true)

food1 = Food.create(name: 'flour', price: 12, quantity: 5, measurement_unit: 'kilos', user_id: user1.id)
food2 = Food.create(name: 'eggs', price: 10, quantity: 3, measurement_unit: 'pieces', user_id: user1.id)
food3 = Food.create(name: 'pork', price: 20, quantity: 2, measurement_unit: 'kilos', user_id: user2.id)
food4 = Food.create(name: 'tomato', price: 3, quantity: 2, measurement_unit: 'kilos', user_id: user2.id)
food5 = Food.create(name: 'sour cream', price: 12, quantity: 2, measurement_unit: 'oz', user_id: user3.id)
food6 = Food.create(name: 'potato', price: 3, quantity: 2, measurement_unit: 'kilos', user_id: user3.id)
food7 = Food.create(name: 'bacon', price: 6, quantity: 200, measurement_unit: 'grams', user_id: user3.id)
food8 = Food.create(name: 'flour tortillas', price: 3, quantity: 6, measurement_unit: 'pieces', user_id: user4.id)
food9 = Food.create(name: 'cream cheese', price: 9, quantity: 6, measurement_unit: 'oz', user_id: user4.id)
food10 = Food.create(name: 'oven-roasted turkey', price: 18, quantity: 9, measurement_unit: 'oz', user_id: user4.id)

RecipeFood.create(recipe: recipe1, food: food1, quantity: 3)
RecipeFood.create(recipe: recipe1, food: food2, quantity: 5)
RecipeFood.create(recipe: recipe2, food: food3, quantity: 1)
RecipeFood.create(recipe: recipe2, food: food4, quantity: 1)
RecipeFood.create(recipe: recipe3, food: food5, quantity: 3)
RecipeFood.create(recipe: recipe3, food: food6, quantity: 1)
RecipeFood.create(recipe: recipe3, food: food7, quantity: 100)
RecipeFood.create(recipe: recipe4, food: food8, quantity: 6)
RecipeFood.create(recipe: recipe4, food: food9, quantity: 8)
RecipeFood.create(recipe: recipe4, food: food10, quantity: 5)
