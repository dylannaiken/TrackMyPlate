class User::ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    
    def show
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
        
        



