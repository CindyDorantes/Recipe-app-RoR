class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, foreign_key: 'food_id'
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true, length: { maximum: 250 }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
