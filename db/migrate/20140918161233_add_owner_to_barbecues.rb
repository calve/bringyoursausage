class AddOwnerToBarbecues < ActiveRecord::Migration
  def change
    add_column :barbecues, :user_id, :integer
  end
end
