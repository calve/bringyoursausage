class BarbecueIngredientsNotNulls < ActiveRecord::Migration
  def change
    change_column_null(:barbecue_ingredients, :ingredient_id, false, 1)
  end
end
