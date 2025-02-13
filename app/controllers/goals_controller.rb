class GoalsController < ApplicationController
end

def index
  @goals = Goal.all
  render json: @goals
end


def show
  @goal = Goal.find(params[:id])
  render json: @goal
end


def create
  @goal = Goal.new(goal_params)
  if @goal.save
    render json: @goal, status: :created
  else
    render json: @goal.errors, status: :unprocessable_entity
  end
end


def update
  @goal = Goal.find(params[:id])
  if @goal.update(goal_params)
    render json: @goal
  else
    render json: @goal.errors, status: :unprocessable_entity
  end
end


def destroy
  @goal = Goal.find(params[:id])
  @goal.destroy
  head :no_content
end

private


def goal_params
  params.require(:goal).permit(:goal_type, :target_weight, :daily_calorie_target, :protein_target, :carbs_target, :fat_target, :target_water)
end
