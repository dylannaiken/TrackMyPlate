class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[show]

  def show
    @daily_log = DailyLog.find_by_user_id(current_user.id)
    @goal = @user.goal
  end

  def edit
    @goal = @user.goal
  end

  def update
    @goal = @user.goal
    if @goal.update(goal_params)
      redirect_to user_profile_path(@user), notice: 'goal was successfully updated'
    else
      render :edit
    end
  end

  private

  def set_profile
    @user = current_user
  end

  def goal_params
    params.require(:goal).permit(:goal_type, :target_weight, :daily_calorie_target)
  end
end
