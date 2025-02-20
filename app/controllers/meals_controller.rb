class MealsController < ApplicationController
  before_action :set_user
  before_action :set_meal, only: %i[show edit update destroy]
  before_action :set_daily_log, only: %i[new create show]
  before_action :authenticate_user!

  def index
    @meals = Meal.all
  end

  def show
    @food = Food.new
    @foods = @meal.foods
  end

  def new
    @user = current_user
    @meal = @daily_log.meals.new
  end

  def create
    Rails.logger.debug "Parameters received: #{params.inspect}"
    @meal = @daily_log.meals.new(meal_params)
    @meal.user_id = current_user.id
    if @meal.save
      redirect_to new_daily_log_meal_food_path(@meal.daily_log, @daily_log, @food), notice: 'Meal was successfully created.'
    else
      Rails.logger.debug "Parameters received: #{@meal.errors.full_messages}"
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

  def set_user
    @user = current_user
  end

  def set_daily_log
    @daily_log = current_user.daily_logs.find(params[:daily_log_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to daily_logs_path, alert: "DailyLog not found or not authorized."
  end

  def set_meal
    @meal = current_user.meals.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to daily_logs_path, alert: "Meal not found or not authorized."
  end

  def meal_params
    params.require(:meal).permit(:user_id, :meal_type, :eaten_at, :daily_log_id)
  end
end
