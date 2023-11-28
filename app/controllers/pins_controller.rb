class PinsController < ApplicationController
  before_action :authenticate_user

  def index
    @pins = Pin.all
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
