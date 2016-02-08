class ChangeDateFormatInBarbecues < ActiveRecord::Migration
  def change
    rename_column :barbecues, :begin_date, :begin_at
  end
  reversible do |change|
    change.up do
      change_column :barbecues, :begin_date, :datetime

    end

    change.down do
      change_column :barbecues, :begin_at, :date
    end
  end
end
