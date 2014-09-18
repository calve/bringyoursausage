class CreateBarbecues < ActiveRecord::Migration
  def change
    create_table :barbecues do |t|
      t.string :title
      t.date :begin_date

      t.timestamps
    end
  end
end
