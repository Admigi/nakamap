class PinsController < ApplicationController
  skip_before_action :authenticate_user!
  # before_action :authenticate_user

  def index
    @pins = Pin.all

    @markers = @pins.geocoded.map do |pin|
      {
        lat: pin.latitude,
        lng: pin.longitude
      }
    end
  end

  def show
    @pin = Pin.find(params[:id])
    @post = Pin.post
  end



  private

  def pin_params
    params.require(:pin).permit!
  end

end
