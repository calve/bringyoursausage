class BarbecueIngredient < ActiveRecord::Base
  belongs_to :barbecue
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient, allow_destroy: false, reject_if: lambda {|attributes| (attributes['title'].blank?)}
end
