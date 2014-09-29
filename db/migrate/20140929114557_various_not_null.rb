class VariousNotNull < ActiveRecord::Migration
  def change
    change_column_null(:barbecues, :title, false, "")
    change_column_null(:barbecues, :user_id, false, 1)
    change_column_null(:ingredients, :title, false, "")
    change_column_null(:barbecue_ingredients, :barbecue_id, false, 1)
    change_column_null(:barbecue_ingredients, :quantity, false, 1)
  end
end
