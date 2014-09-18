class Barbecue < ActiveRecord::Base
  has_many :barbecue_ingredient
  has_many :ingredient, :through => :barbecue_ingredient
end
