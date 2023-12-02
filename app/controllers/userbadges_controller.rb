class UserbadgesController < ApplicationController
    before_action :set_userbadge, only: [:show, :edit, :update, :destroy]
  
    def index
      @userbadges = Userbadge.all
    end
  
    def show
    end
  
    def new
      @userbadge = Userbadge.new
    end
  
    def create
      @userbadge = Userbadge.new(userbadge_params)
  
      if @userbadge.save
        redirect_to @userbadge, notice: 'Userbadge was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @userbadge.update(userbadge_params)
        redirect_to @userbadge, notice: 'Userbadge was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @userbadge.destroy
      redirect_to userbadges_url, notice: 'Userbadge was successfully destroyed.'
    end
  
    private
  
    def set_userbadge
      @userbadge = Userbadge.find(params[:id])
    end
  
    def userbadge_params
      params.require(:userbadge).permit(:name, :description, :user_id, :badge_id)
    end
  end