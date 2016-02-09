class SetDefaultUserName < ActiveRecord::Migration
  def change
    change_column :users, :name, :text, default: "Guest"
  end
end
