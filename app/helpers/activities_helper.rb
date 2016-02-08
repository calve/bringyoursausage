module ActivitiesHelper

  def format_message(activity)
    begin
      user = activity.user
      case activity.action
      when "create_ingredient"
        ingredient = activity.extra_data.barbecue_ingredient_id
        quantity = ingredient.title
        ingredient = ingredient.title
        return "#{user.name} added #{quantity} #{ingredient}"
      when "create_barbecue"
        return "#{user.name} created barbecue"
      else
        return "Notfound"
      end
    rescue => ex
      return "Error formatting activity #{activity} : #{ex}"
    end
  end
end
