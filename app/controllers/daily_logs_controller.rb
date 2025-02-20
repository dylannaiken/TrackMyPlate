class DailyLogsController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  before_action :set_daily_log, only: %i[show update destroy]

  def show
    @daily_log = DailyLog.find(params[:id])
    @user = current_user
    @meal = Meal.new
  end

  def create
    @daily_log = current_user.daily_logs.new(daily_log_params)
    if @daily_log.save
      render json: @daily_log, status: :created
    else
      render json: @daily_log.errors, status: :unprocessable_entity
    end
  end

  def update
    if @daily_log.update(daily_log_params)
      render json: @daily_log
    else
      render json: @daily_log.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @daily_log.destroy
    head :no_content
  end

  private

  def set_user
    @user = current_user
  end

  def set_daily_log
    @daily_log = current_user.daily_logs.find(params[:id])
  end

  def daily_log_params
    params.require(:daily_log).permit(:log_date, :remaining_calories, :remaining_proteins, :remaining_carbs, :remaining_fats, :remaining_water)
  end
end
