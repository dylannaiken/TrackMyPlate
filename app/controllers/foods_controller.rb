class FoodsController < ApplicationController
  before_action :set_meal, only: [:new, :create]

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = @meal.foods.build(food_params)
    if @food.save
      redirect_to @food, notice: "Aliment ajouté avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_meal
      daily_log = current_user.daily_logs.find(params[:daily_log_id])
      @meal = daily_log.meals.find(params[:meal_id])
  end

  def food_params
    params.require(:food).permit(:food_name, :serving_size, :serving_unit)
  end
end
