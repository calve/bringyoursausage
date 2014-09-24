class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.integer :ingredient_id, null: false
      t.integer :barbecue_id , null: false
      t.integer :user_id , null: false
      t.integer :quantity , null: false

      t.timestamps
    end
  end
end
