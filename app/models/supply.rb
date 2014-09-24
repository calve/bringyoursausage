class Supply < ActiveRecord::Base
  validates :barbecue, :ingredient, :user, presence: true
  belongs_to :barbecue
  belongs_to :ingredient
  belongs_to :user
end
