class Supply < ActiveRecord::Base
  validates :barbecue, :ingredient, :user, presence: true
  belongs_to :barbecue
  belongs_to :ingredient
  belongs_to :user

  after_create do |supply|
    Activity.create(action: "create_supply", extra_data: {supply_id: self.id}, barbecue: self.barbecue, user: supply.user)
  end
end
