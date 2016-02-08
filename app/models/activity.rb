class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :barbecue
  serialize :extra_data
end
