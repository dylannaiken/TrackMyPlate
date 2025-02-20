class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_current_daily_log
  before_action :set_current_user

  private

  def set_current_user
    @current_user = current_user
  end

  def set_current_daily_log
    if user_signed_in?
      @current_daily_log = current_user.daily_logs.order(created_at: :desc).first
    end
  end
end
