class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, foreign_key: 'recipe_id'
  has_many :foods, through: :recipe_foods

  validates :name, presence: true, length: { maximum: 250 }

  def return_recipe_foods
    this.recipe_foods.each do |recipe_food|
      food = recipe_food.food
      food[:quantity] = recipe_food.quantity
      @required_foods << food
    end
  end

  def total_food_items
    recipe_foods.count
  end

  def total_price
    total_price = 0
    recipe_foods.each do |recipe_food|
      total_price += recipe_food.quantity * recipe_food.food.price
    end
    total_price
  end
end
