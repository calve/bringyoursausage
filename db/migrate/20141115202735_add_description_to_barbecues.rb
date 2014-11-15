class AddDescriptionToBarbecues < ActiveRecord::Migration
  def change
    add_column :barbecues, :description, :text
  end
end
