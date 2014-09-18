class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :title
      t.integer :average_price

      t.timestamps
    end
  end
end
