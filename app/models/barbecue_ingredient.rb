class BarbecueIngredient < ActiveRecord::Base
  belongs_to :barbecue
  belongs_to :ingredient
end
