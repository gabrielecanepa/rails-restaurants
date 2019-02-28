class Admin::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.where(address: 'Codymouth')
  end
end
