class BarbecueIngredient < ActiveRecord::Base
  belongs_to :barbecue
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient, allow_destroy: false, reject_if: lambda {|attributes| (attributes['title'].blank?)}

  after_create do |supply|
    Activity.create(action: "create_barbecue", barbecue: self.barbecue, user: self.user)
  end
end
