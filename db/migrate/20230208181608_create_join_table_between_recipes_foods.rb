class CreateJoinTableBetweenRecipesFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods, id: false do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :food, index: true
      t.integer :quantity
    end
  end
end
