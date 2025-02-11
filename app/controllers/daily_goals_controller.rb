class DailyGoalsController < ApplicationController
  def edit
    @user = current_user
    @daily_goal = Daily_goal.find(params[:id])
  end

  def update
    @user = current_user
    @daily_goal = @user.Daily_goal.find(params[:id])
    if @daily_goal.update(daily_goal_params)
      redirect_to @daily_goal, notice: "You're daily goal was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def daily_goal_params
    params.require(:daily_goal).permit(:daily_calories, :daily_proteins, :daily_carbs, :daily_fats)
  end
end
