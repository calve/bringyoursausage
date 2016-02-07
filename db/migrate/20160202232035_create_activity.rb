class CreateActivity < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :barbecue, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.string :action
      t.string :extra_data

      t.timestamps
    end
  end
end
