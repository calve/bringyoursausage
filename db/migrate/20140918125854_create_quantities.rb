class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|
      t.integer :ingredient_id
      t.integer :barbecue_id
      t.integer :quantity

      t.timestamps
    end
  end
end
