class PinsController < ApplicationController
  skip_before_action :authenticate_user!
  # before_action :authenticate_user

  def index
    @pins = Pin.all

    @markers = @pins.geocoded.map do |pin|
      {
        lat: pin.latitude,
        lng: pin.longitude,
        marker_html: render_to_string(partial: "pin"),
        info_window_html: render_to_string(partial: "info_window", locals: { pin: pin })
      }
    end
  end

  def show
    @pin = Pin.find(params[:id])
    redirect_to root_path unless @post.pin == params[:pin_id]
  end



  private

  def pin_params
    params.require(:pin).permit!
  end

end
