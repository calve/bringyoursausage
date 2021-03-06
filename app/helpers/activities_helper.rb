module ActivitiesHelper

  def format_message(activity)
    begin
      user = activity.user
      case activity.action
      when "create_ingredient"
        ingredient = BarbecueIngredient.find activity.extra_data[:barbecue_ingredient_id]
        return "#{user.name} added #{ingredient.quantity} #{ingredient.ingredient.title}"
      when "create_supply"
        supply = Supply.find(activity.extra_data[:supply_id])
        quantity = supply.quantity
        ingredient = supply.ingredient.title
        return "#{user.name} bring #{quantity} #{ingredient}"
      when "create_barbecue"
        return "#{user.name} created barbecue"
      else
        return "Notfound"
      end
    rescue => ex
      return "Error formatting activity for #{activity.action} (#{user.name}) : #{ex}"
    end
  end
end
