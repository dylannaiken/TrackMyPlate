class NutritionsController < ApplicationController
  def index
    @nutritions = Nutrition.all
  end

  def show
    @nutrition = Nutrition.find(params[:id])
  end
end
