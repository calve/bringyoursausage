class WelcomeController < ApplicationController
  def index
    @barbecues = Barbecue.all
  end
end
