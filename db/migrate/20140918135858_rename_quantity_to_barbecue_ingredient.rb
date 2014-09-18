class RenameQuantityToBarbecueIngredient < ActiveRecord::Migration
  def change
    rename_table :quantities, :barbecue_ingredients
  end
end
