class Barbecue < ActiveRecord::Base
  has_many :barbecue_ingredient
  has_many :ingredient, :through => :barbecue_ingredient
  has_many :supply
  has_many :attending_user, :through => :supply
  belongs_to :user
end
