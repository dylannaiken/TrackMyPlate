class MealItemsController < ApplicationController
  def new
    @meal_item = Meal_item.new
  end

  def create
    @meal_item = Meal_item.new
    if @meal_item.save
      redirect_to @meal_item, notice: 'Item was successfully added'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def meal_item_params
    params.require(:meal_item).permit(:quantity)
  end
end
