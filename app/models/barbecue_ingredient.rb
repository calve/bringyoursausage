class BarbecueIngredient < ActiveRecord::Base
  belongs_to :barbecue
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient, allow_destroy: false, reject_if: lambda {|attributes| (attributes['title'].blank?)}

  after_create do |supply|
    Activity.create(action: "create_ingredient", extra_data: {barbecue_ingredient_id: self.id}, barbecue: self.barbecue, user: self.barbecue.user)
  end
end
