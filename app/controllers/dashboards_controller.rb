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
      # If the user has uploaded a new image, attach it to the user
      @user.image_url.attach(params[:user][:image_url]) if params[:user][:image_url].present?

      redirect_to dashboards_path(@user), notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :bio, :image_url)
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