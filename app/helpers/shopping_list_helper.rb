module ShoppingListHelper
  def calculate_total_price(combined_foods)
    total_price = 0
    combined_foods.each do |missing_food|
      food = Food.find_by(name: missing_food[:name])
      total_price += missing_food[:required_quantity] * food.price
    end
    total_price
  end

  def combine_foods(foods)
    grouped_foods = foods.group_by { |hash| hash[:name] }
    grouped_foods.map do |name, group|
      {
        name:,
        required_quantity: group.map { |hash| hash[:required_quantity] }.sum,
        price: group.first[:price],
        measurement_unit: group.first[:measurement_unit]
      }
    end
  end

  def diff_in_stock(stock_hash, required_foods)
    required_foods.reduce([]) do |result, required_food|
      difference = required_food.quantity - stock_hash.fetch(required_food.name, 0)
      if difference.positive?
        stock_hash[required_food.name] = 0
        result << { name: required_food.name, required_quantity: difference,
                    price: required_food.price, measurement_unit: required_food.measurement_unit }
      else
        stock_hash[required_food.name] -= required_food.quantity
        result
      end
    end
  end
end
