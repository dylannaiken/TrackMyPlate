class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit update destroy]
  before_action :set_daily_log, only: %i[new create]

  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
    @food = Food.new
    @foods = @meal.foods
  end

  def new
    @daily_log = current_user.daily_logs.find(params[:daily_log_id])
    @meal = @daily_log.meals.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to @meal, notice: 'Meal was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
      redirect_to @meal, notice: 'Meal was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @meal.destroy
    redirect_to meals_path, notice: 'Meal was successfully deleted.'
  end

  private

  def set_daily_log
    @daily_log = current_user.daily_logs.find(params[:daily_log_id])
  end

  def set_meal
    @meal = current_user.meals.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:meal_type, :eaten_at)
  end
end
