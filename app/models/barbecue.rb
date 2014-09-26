class Barbecue < ActiveRecord::Base
  has_many :barbecue_ingredient
  has_many :ingredient, :through => :barbecue_ingredient
  has_many :supply
  has_many :attending_user, :through => :supply
  belongs_to :user
  accepts_nested_attributes_for :barbecue_ingredient, allow_destroy: true, reject_if: lambda {|attributes| (attributes['quantity'].blank? || attributes['ingredient_id'].blank?)}
end
