class Ingredient < ActiveRecord::Base
  has_many :barbecue_ingredient
  has_many :barbecue, :through => :barbecue_ingredient
  has_many :supply
  has_many :supplied_ingredient, :through => :supply
end
