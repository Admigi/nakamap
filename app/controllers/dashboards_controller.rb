class DashboardsController < ApplicationController
  before_action :authenticate_user!
  include BadgesHelper

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      # Redirect to the dashboard show page after a successful update
      redirect_to dashboards_path, notice: 'Profile updated successfully.'
    else
      # If update fails, render the edit form again
      render :edit
    end
  end

  private

  def user_params
    # Define the allowed parameters for updating the user (e.g., :username, :bio, :photo)
    params.require(:user).permit(:username, :bio, :photo)
  end

  def badge_count(badge)
    # Logic to count the number of times the user has received the badge
    @user.userbadges.where(badge: badge).count
  end

  def badge_type(badge)
    # Logic to determine the badge type based on some criteria
    if badge.name.include?('Gold')
      'Gold Badge'
    elsif badge.name.include?('Silver')
      'Silver Badge'
    else
      'Unknown Badge Type'
    end
  end
end